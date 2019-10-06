import React, { Component } from "react";
import PropTypes from "prop-types";
import Formsy from "formsy-react";
import FormsyInput from "./shared/FormsyComponents";
const path = require("path");

class ContactForm extends Component {
  static propTypes = {
    formInfo: PropTypes.object
  };

  constructor(props) {
    super(props);
    this.state = {};
  }

  disableButton = () => {
    this.setState({ canSubmit: false });
  };

  enableButton = () => {
    this.setState({ canSubmit: true });
  };

  handleFormSubmit = data => {
    let url = "/pages/contact";
    let params = {
      first_name: data.firstName,
      last_name: data.lastName,
      email: data.email,
      subject: data.subject,
      message: data.message
    };
    var esc = encodeURIComponent;
    var query = Object.keys(params)
      .map(k => esc(k) + "=" + esc(params[k]))
      .join("&");
    url = url + `?${query}`;
    fetch(url, {
      method: "post",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      }
    })
      .then(res => res.json())
      .then(data => {
        this.setState({
          formInfo: data
        });
      });
  };

  render() {
    const { formInfo } = this.state;
    return (
      <div>
        <Formsy
          onValidSubmit={this.handleFormSubmit}
          className="videos-form directUpload"
          onValid={this.enableButton}
          onInvalid={this.disableButton}
        >
          <FormsyInput
            type="text"
            className="form-group"
            name="firstName"
            label="First name"
            validations="minLength:2"
            validationError="Please enter your first name"
            required
          />
          <FormsyInput
            type="text"
            className="form-group"
            name="lastName"
            label="Last name"
            validations="minLength:2"
            validationError="Please enter your last name"
            required
          />
          <FormsyInput
            type="text"
            className="form-group"
            name="email"
            label="Email"
            validations="isEmail"
            validationError="Please enter a valid email address"
            required
          />
          <FormsyInput
            className="form-group"
            type="text"
            name="subject"
            label="Subject"
            validations="minLength:2"
            validationError="Please enter email subject"
            required
          />
          <FormsyInput
            type="textarea"
            className="form-group"
            name="message"
            label="Message"
            validations="minLength:2"
            validationError="Please enter email message"
            required
          />
          <div className="actions">
            <button type="submit" className="btn btn-primary submit">
              Submit
            </button>
          </div>
          {formInfo && formInfo.success === true && (
            <div className="row">
              <p id="notice" className="container-contact-notice">
                Message Sent !!!
              </p>
              <div className="container-contact-link">
                <a href="/">Return Home</a>
              </div>
            </div>
          )}
          {formInfo && formInfo.success === false && (
            <div className="row">
              <p id="notice" className="container-contact-notice">
                We encountered some problems sending your message. Please try
                again later or contact &nbsp;
                <a href="mailto: support@supercomedian.com">
                  support@supercomedian.com
                </a>
              </p>
              <div className="container-contact-link">
                <a href="/">Return Home</a>
              </div>
            </div>
          )}
        </Formsy>
      </div>
    );
  }
}

export default ContactForm;
