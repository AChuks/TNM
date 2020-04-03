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
    let params = {};
    let url = "/videos";
    const videoID = videosInfo.video.id;
    if (videoID) {
      url = url + `/${videoID}`;
    }
    if (!videosInfo.manual) {
      let bucketPath;
      let fileName;
      if (!videoID) {
        bucketPath = path.dirname(videosInfo.presignedS3Post.fields.key);
        let filepath = path.basename(new URL(data.file).pathname);
        fileName = filepath.substring(
          filepath.lastIndexOf("\\") + 1,
          filepath.length
        );
      }
      params = {
        "video[url]": videoID
          ? `${videosInfo.video.url}`
          : `${videosInfo.presignedS3Post.url}/${bucketPath}/${fileName}`,
        "video[author]": data.name || videosInfo.video.author,
        "video[author_email]": data.email || videosInfo.video.email,
        "video[title]": data.title || videosInfo.video.title,
        "video[description]": data.description || videosInfo.video.description,
        "video[vimeo_video_id]": data.vimeoID || videosInfo.video.vimeo_video_id,
        "video[frame]": data.frame || videosInfo.video.frame,
        "video[agreed_to_vid_sub_policy]":
          data.agreedToVidSubPolicy || videosInfo.video.agreed_to_vid_sub_policy
      };
      if (!params["video[vimeo_video_id]"]) {
        delete params["video[vimeo_video_id]"];
      }
      if (!params["video[frame]"]) {
        delete params["video[frame]"];
      }
    } else {
      params = {
        "video[author]": data.name || videosInfo.video.author,
        "video[author_email]": data.email || videosInfo.video.email,
        "video[url]": data.url || videosInfo.video.url,
        "video[title]": data.title || videosInfo.video.title,
        "video[description]": data.description || videosInfo.video.description,
        "video[is_youtube]": true,
        "video[is_irl]": true,
        "video[agreed_to_vid_sub_policy]": true,
        "video[date]": data.date || videosInfo.video.date
      };
    }

    var esc = encodeURIComponent;
    var query = Object.keys(params)
      .map(k => esc(k) + "=" + esc(params[k]))
      .join("&");
    url = url + `?${query}`;
    fetch(url, {
      method: videoID ? "PATCH" : "POST",
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
        if (data.videoUploadSuccess === true && !videoID) {
          window.location.href = '/submit'
        } else {
          this.scrollToTopOfMessage();
        }
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
          data-url={
            videosInfo.presignedS3Post && videosInfo.presignedS3Post.url
          }
          data-host={
            videosInfo.presignedS3Post && videosInfo.presignedS3Post.url
          }
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
            value={videosInfo.video.author}
          />
          {videosInfo.manual && (
            <FormsyInput
              type="text"
              className="form-group"
              name="url"
              label="Url"
              validations="minLength:2"
              validationError="Please video url"
              required
              value={videosInfo.video.url}
            />
          )}
          <FormsyInput
            type="text"
            className="form-group"
            name="email"
            label="Email"
            validations="isEmail"
            validationError="Please enter a valid email address"
            required
            value={videosInfo.video.author_email}
          />
          <FormsyInput
            className="form-group"
            type="text"
            name="title"
            label="Video Title"
            validations="minLength:2"
            validationError="Please enter the title of your video"
            required
            value={videosInfo.video.title}
          />
          <FormsyInput
            type="textarea"
            className="form-group"
            name="description"
            label="Video Description"
            validations="minLength:2"
            validationError="Please enter the description of your video"
            required
            value={videosInfo.video.description}
          />
          {videosInfo.manual && (
            <FormsyInput
              type="date"
              className="form-group"
              name="date"
              label="Date"
              validationError="Please select a date"
              required
              value={videosInfo.video.date}
            />
          )}
          {videosInfo.video.author_email !== null && (
            <FormsyInput
              type="text"
              className="form-group"
              name="vimeoID"
              label="Vimeo Video ID"
              value={videosInfo.video.vimeo_video_id}
            />
          )}
          {videosInfo.video.author_email !== null && (
            <FormsyInput
              type="textarea"
              className="form-group"
              name="frame"
              label="Vimeo Iframe"
              value={videosInfo.video.frame}
            />
          )}
          {videosInfo.video.author_email === null && !videosInfo.manual && (
            <FormsyInput
              type="file"
              className="form-group form-file"
              name="file"
              required
            />
          )}
          {videosInfo.video.author_email === null && !videosInfo.manual && (
            <FormsyInput
              type="checkbox"
              className="form-group form-checkbox"
              name="agreedToVidSubPolicy"
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
                {videosInfo.video.id
                  ? "Video Updated"
                  : "Video was successfully submitted"}
              </p>
              <div className="container-upload-video-link">
                <a href="/">Return Home</a>
              </div>
            </div>
          )}
          {videosInfo && videosInfo.videoUploadSuccess === false && (
            <div className="row container-upload-video-message">
              <p id="notice" className="container-upload-video-notice">
                We encountered some problems processing your video. Please again
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
