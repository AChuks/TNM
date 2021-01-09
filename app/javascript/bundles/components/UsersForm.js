import React, { Component } from "react";
import PropTypes from "prop-types";
import Formsy from "formsy-react";
import FormsyInput from "./shared/FormsyComponents";
const path = require("path");
import * as Scroll from "react-scroll";

class UsersForm extends Component {
  static propTypes = {
    usersInfo: PropTypes.object
  };

  constructor(props) {
    super(props);
    this.state = {
      usersInfo: props.usersInfo,
      canSubmit: false
    };
  }

  disableButton = () => {
    this.setState({ canSubmit: false });
  };

  enableButton = () => {
    this.setState({ canSubmit: true });
  };

  handleFormSubmit = data => {
    const { usersInfo } = this.state;
    const userID = usersInfo.user.id;

    let url = "/users";
    if (userID) {
      url = url + `/${userID}`;
    }
    let params = {
      "user[user_name]": data.userName || usersInfo.user.user_name,
      "user[email]": data.email || usersInfo.user.email,
      "user[current_password]": data.currentPassword,
      "user[password]": data.password,
      "user[password_confirmation]": data.passwordConfirmation
    };
    if (!params["user[current_password]"]) {
      delete params["user[current_password]"];
    }
    if (!params["user[password]"]) {
      delete params["user[password]"];
    }
    if (!params["user[password_confirmation]"]) {
      delete params["user[password_confirmation]"];
    }

    var esc = encodeURIComponent;
    var query = Object.keys(params)
      .map(k => esc(k) + "=" + esc(params[k]))
      .join("&");
    url = url + `?${query}`;
    fetch(url, {
      method: userID ? "PATCH" : "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      }
    })
      .then(res => res.json())
      .then(data => {
        this.setState({
          usersInfo: data
        });
        this.scrollToTopOfMessage();
      });
  };

  scrollToTopOfMessage = () => {
    let scroll = Scroll.animateScroll;
    let messageOffsetTop = document.getElementsByClassName(
      "container-save-user-message"
    )[0].offsetTop;
    scroll.scrollTo(messageOffsetTop);
  };

  render() {
    const { usersInfo } = this.state;
    return (
      <div>
        <Formsy
          onValidSubmit={this.handleFormSubmit}
          className="users-form"
          onValid={this.enableButton}
          onInvalid={this.disableButton}
        >
          <FormsyInput
            type="text"
            className="form-group"
            name="userName"
            label="Username"
            validations="minLength:2"
            validationError="Please enter your name"
            required
            value={usersInfo.user.user_name}
          />
          <FormsyInput
            type="text"
            className="form-group"
            name="email"
            label="Email"
            validations="isEmail"
            validationError="Please enter a valid email address"
            required
            value={usersInfo.user.email}
          />
          {usersInfo.user.id && (
            <FormsyInput
              className="form-group"
              type="text"
              name="currentPassword"
              label="Current Password"
              validations="minLength:6"
              validationError="Please enter your current password"
              required
            />
          )}
          <FormsyInput
            className="form-group"
            type="text"
            name="password"
            label={usersInfo.user.id ? "New Password" : "Password"}
            validations="minLength:6"
            validationError="Please enter a password with minimum length of 6"
            required
          />
          <FormsyInput
            className="form-group"
            type="text"
            name="passwordConfirmation"
            label={
              usersInfo.user.id
                ? "New Password Confirmation"
                : "Password Confirmation"
            }
            validations="equalsField:password"
            validationError="Password confirmation doesn't match password"
            required
          />

          <div className="actions">
            <button type="submit" className="btn btn-primary submit">
              Submit
            </button>
          </div>
          {usersInfo && usersInfo.success === true && (
            <div className="row container-save-user-message">
              <p id="notice" className="container-admin-users-notice">
                {usersInfo.user.id
                  ? "User Updated"
                  : "User was successfully created"}
              </p>
              <div className="container-admin-users-link">
                <a href="/">Return Home</a>
              </div>
            </div>
          )}
          {usersInfo && usersInfo.success === false && (
            <div className="row container-save-user-message">
              <p id="notice" className="container-admin-users-notice">
                We encountered some problems processing your user info. Please
                try again later or contact &nbsp;
                <a href="mailto: support@supercomedian.com">
                  support@supercomedian.com
                </a>
              </p>
              <div className="container-admin-users-link">
                <a href="/">Return Home</a>
              </div>
            </div>
          )}
        </Formsy>
      </div>
    );
  }
}

export default UsersForm;
