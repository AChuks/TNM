import React, { Component } from "react";
import SuperComedianLogo from "../../assets/images/super_comedian.svg";
import ReactSVG from "react-svg";
import { Form, Input } from "formsy-react-components";

class Header extends Component {
  static propTypes = {};

  constructor(props) {
    super(props);
    this.state = {
      loggedIn: false,
      showSearchForm: false,
      resized: false
    };
  }

  componentDidMount = () => {
    this.getAdminStatus();
    window.addEventListener("scroll", this.handleScroll);
    window.addEventListener("resize", this.updateDimensions);
  };

  componentWillUnmount = () => {
    window.removeEventListener("scroll", this.handleScroll);
  };

  updateDimensions = () => {
    this.setState({ resized: true });
  };

  handleScroll = () => {
    var navBar = document.getElementsByClassName("navbar-container");
    if (navBar && navBar[0]) {
      var scrollPos = document.scrollingElement.scrollTop;
      if (scrollPos > 0) {
        navBar[0].style.background =
          "linear-gradient(rgba(0,0,0,.9) 1%,rgba(0,0,0,.8) 15%,rgba(0,0,0,.7) 30%,rgba(0,0,0,.6) 45%,rgba(0,0,0,.5) 60%,rgba(0,0,0,.3) 75%,transparent)";
      } else if (scrollPos === 0) {
        navBar[0].style.background = "transparent";
      }
    }

    // var relatedVideo = document.getElementsByClassName("content-videos-header-videos-section-related")[0];
    // var disqusThread = document.getElementsByClassName("disqus-thread")[0];
    // if (relatedVideo && disqusThread && relatedVideo.offsetHeight !== disqusThread.scrollHeight) {
    //     console.log(disqusThread.scrollHeight);
    //     relatedVideo.style.height = disqusThread.scrollHeight + 'px';
    // }
  };

  handleSearchText = data => {
    window.location.href = `/pages/search?search_text=${data.search_text}&page=1`;
  };

  getAdminStatus = () => {
    const url = "/pages/status";
    fetch(url, {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      }
    })
      .then(res => res.json())
      .then(data => {
        this.setState({
          loggedIn: data.loggedIn
        });
      });
  };

  isVisibleNavbarToggle = () => {
    let navbarToggleVisible = document.getElementsByClassName("navbar-toggle");
    if (navbarToggleVisible && navbarToggleVisible[0]) {
      return navbarToggleVisible[0].offsetHeight > 0;
    }
    return false;
  };

  handleSearchIcon = () => {
    const { showSearchForm } = this.state;
    this.setState({ showSearchForm: !showSearchForm });
  };

  render() {
    const { loggedIn, showSearchForm } = this.state;
    const navbarToggleVisible = this.isVisibleNavbarToggle();
    const navBar = document.getElementsByClassName("navbar-container")[0];
    return (
      <nav className="navbar" role="navigation">
        <div className="navbar-header">
          <button
            type="button"
            className="navbar-toggle"
            data-toggle="collapse"
            data-target="#navbar-id"
          >
            <span className="icon-bar"></span>
            <span className="icon-bar"></span>
            <span className="icon-bar"></span>
          </button>
        </div>
        <div className="navbar-container">
          <ul className="nav navbar-nav pull-left col-xs-3">
            <li>
              <a className="navbar-logo" href="/">
                <ReactSVG src={SuperComedianLogo} />
              </a>
            </li>
          </ul>
          <div className="collapse navbar-collapse" id="navbar-id">
            <ul
              className="col-xs-9 nav navbar-nav pull-right"
              style={{
                // display: navbarToggleVisible ? "block" : "-webkit-inline-box",
                marginTop: navbarToggleVisible ? "45px" : "0px"
              }}
            >
              {loggedIn && (
                <li
                  style={{
                    display: navbarToggleVisible ? "contents" : "block"
                  }}
                >
                  <a
                    className="navbar-links"
                    href="/admin/logout"
                    data-method="delete"
                  >
                    Log Out
                  </a>
                </li>
              )}
              {loggedIn && (
                <li
                  style={{
                    display: navbarToggleVisible ? "contents" : "block"
                  }}
                >
                  <a className="navbar-links" href="/users">
                    Users
                  </a>
                </li>
              )}
              {loggedIn && (
                <li
                  style={{
                    display: navbarToggleVisible ? "contents" : "block"
                  }}
                >
                  <a className="navbar-links" href="/videos">
                    Videos
                  </a>
                </li>
              )}
              <li
                style={{ display: navbarToggleVisible ? "contents" : "block" }}
              >
                <a
                  className="navbar-links"
                  href="/contact"
                  style={{
                    padding: navbarToggleVisible ? "0px 15px 0px 15px" : "21px",
                    marginTop: navbarToggleVisible ? "10px" : "0px"
                  }}
                >
                  Contact Us
                </a>
              </li>
              <li
                style={{ display: navbarToggleVisible ? "contents" : "block" }}
              >
                <a
                  className="navbar-links"
                  href="/videos/new"
                  style={{
                    padding: navbarToggleVisible ? "0px 15px 0px 15px" : "21px",
                    marginTop: navbarToggleVisible ? "10px" : "0px"
                  }}
                >
                  Submit Video
                </a>
              </li>
              <li
                style={{ display: navbarToggleVisible ? "contents" : "block" }}
              >
                {!navbarToggleVisible && (
                  <a
                    className="navbar-links navbar-links-search"
                    onClick={this.handleSearchIcon}
                  >
                    <i className="fa fa-search"></i>
                  </a>
                )}
                {navbarToggleVisible && (
                  <div className="col-xs-9 col-xs-offset-3 search-toggle">
                    <Form
                      onSubmit={this.handleSearchText}
                      className="form-search"
                    >
                      <Input
                        value=""
                        name="search_text"
                        title="search"
                        placeholder="Search videos ..."
                      />
                    </Form>
                  </div>
                )}
              </li>
            </ul>
          </div>
        </div>
        {showSearchForm && !navbarToggleVisible && (
          <div
            className={`col-xs-9 col-xs-offset-3 search${
              loggedIn ? "-admin" : ""
            }`}
            style={{ top: navBar.offsetHeight + "px" }}
          >
            <Form onSubmit={this.handleSearchText} className="form-search">
              <Input
                value=""
                name="search_text"
                title="search"
                placeholder="Search videos ..."
              />
            </Form>
          </div>
        )}
      </nav>
    );
  }
}

export default Header;
