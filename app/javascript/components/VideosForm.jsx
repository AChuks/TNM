import React, { Component } from "react";
import PropTypes from "prop-types";
import Formsy from "formsy-react";
import FormsyInput from "./shared/FormsyComponents";
const path = require("path");
import * as Scroll from "react-scroll";

class VideosForm extends Component {
  static propTypes = {
    videosInfo: PropTypes.object
  };

  constructor(props) {
    super(props);
    this.state = {
      videosInfo: props.videosInfo,
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
    const { videosInfo } = this.state;
    let bucketPath = path.dirname(videosInfo.presignedS3Post.fields.key);
    var filepath = path.basename(new URL(data.file).pathname);
    let fileName = filepath.substring(
      filepath.lastIndexOf("\\") + 1,
      filepath.length
    );
    let url = "/videos";
    let params = {
      "video[url]": `${videosInfo.presignedS3Post.url}/${bucketPath}/${fileName}`,
      "video[author]": data.name,
      "video[author_email]": data.email,
      "video[title]": data.title,
      "video[description]": data.description
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
          videosInfo: data
        });
        this.scrollToTopOfMessage();
      });
  };

  scrollToTopOfMessage = () => {
    let scroll = Scroll.animateScroll;
    let messageOffsetTop = document.getElementsByClassName(
      "container-upload-video-message"
    )[0].offsetTop;
    scroll.scrollTo(messageOffsetTop);
  };

  render() {
    const { videosInfo } = this.state;
    return (
      <div>
        <Formsy
          onValidSubmit={this.handleFormSubmit}
          className="videos-form directUpload"
          onValid={this.enableButton}
          onInvalid={this.disableButton}
          data-form-data={JSON.stringify(videosInfo.policy)}
          data-url={videosInfo.presignedS3Post.url}
          data-host={videosInfo.presignedS3Post.url}
          encType="multipart/form-data"
        >
          <FormsyInput
            type="text"
            className="form-group"
            name="name"
            label="Name"
            validations="minLength:2"
            validationError="Please enter your name"
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
            name="title"
            label="Video Title"
            validations="minLength:2"
            validationError="Please enter the title of your video"
            required
          />
          <FormsyInput
            type="textarea"
            className="form-group"
            name="description"
            label="Video Description"
            validations="minLength:2"
            validationError="Please enter the description of your video"
            required
          />
          {videosInfo.video.author_email !== null && (
            <FormsyInput
              type="text"
              className="form-group"
              name="vimeoID"
              label="Vimeo Video ID"
            />
          )}
          {videosInfo.video.author_email !== null && (
            <FormsyInput
              type="text"
              className="form-group"
              name="frame"
              label="Vimeo Iframe"
            />
          )}
          {videosInfo.video.author_email === null && (
            <FormsyInput
              type="file"
              className="form-group form-file"
              name="file"
              required
            />
          )}
          <div className="actions">
            <button type="submit" className="btn btn-primary submit">
              Submit
            </button>
          </div>
          {videosInfo && videosInfo.videoUploadSuccess === true && (
            <div className="row container-upload-video-message">
              <p id="notice" className="container-upload-video-notice">
                Video was successfully submitted
              </p>
              <div className="container-upload-video-link">
                <a href="/">Return Home</a>
              </div>
            </div>
          )}
          {videosInfo && videosInfo.videoUploadSuccess === false && (
            <div className="row container-upload-video-message">
              <p id="notice" className="container-upload-video-notice">
                We encountered some problems processing your video. Please try
                again later or contact &nbsp;
                <a href="mailto: support@supercomedian.com">
                  support@supercomedian.com
                </a>
              </p>
              <div className="container-upload-video-link">
                <a href="/">Return Home</a>
              </div>
            </div>
          )}
        </Formsy>
      </div>
    );
  }
}

export default VideosForm;
