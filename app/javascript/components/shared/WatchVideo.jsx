import React, { Component } from "react";
import PropTypes from "prop-types";

class WatchVideo extends Component {
  static propTypes = {
    currentVideo: PropTypes.object.isRequired,
    closeCallback: PropTypes.func.isRequired
  };

  constructor(props) {
    super(props);
    this.state = {
      currentVideo: props.currentVideo
    };
  }

  render() {
    const { currentVideo } = this.state;
    const { closeCallback } = this.props;
    return (
      <div className="duplicate-survey-form-modal">
        <div className="col-xs-12 modal-content">
          <div className="modal-body">
            <div className="well">
              <div className="row">
                <video
                  id="vid1"
                  autoPlay
                  className="video-js vjs-default-skin preview-video"
                  controls
                  width="700"
                  height="700"
                  source
                  src={currentVideo.url}
                  type="video/mp4"
                ></video>
              </div>
            </div>
            <button
              className="close-button btn btn-xs btn-info"
              onClick={() => closeCallback()}
            >
              Close
            </button>
          </div>
        </div>
      </div>
    );
  }
}

export default WatchVideo;
