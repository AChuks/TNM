import React, { Component } from "react";
import PropTypes from "prop-types";

class CarouselVideos extends Component {
  static propTypes = {
    carouselVideos: PropTypes.array
  };

  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    const { carouselVideos } = this.props;
    const parser = new DOMParser();
    return (
      <div className="owl-carousel owl-theme">
        {carouselVideos.map((carouselVideo, index) => {
          if (
            carouselVideo.meta_data ||
            carouselVideo.is_irl ||
            (carouselVideo.accepted && !carouselVideo.is_irl)
          ) {
            let videoTitle = parser.parseFromString(
              carouselVideo.title,
              "text/html"
            ).body.textContent;
            let url = `watch?url=${carouselVideo.url};meta_data=${carouselVideo.meta_data}`;
            if (carouselVideo.vimeo_video_id) {
              url = `/watch?url=${carouselVideo.url};upload=true`;
            }
            if (carouselVideo.is_irl) {
              url = `/watch?url=${carouselVideo.url};irl=true`;
            }
            return (
              <div
                className="hover-effect"
                style={{ width: "280px", paddingLeft: "20px" }}
                key={index}
              >
                <div className="view view-first carou-img">
                  <div className="masked">
                    <a href={url}>
                      <img
                        src={`https://i.ytimg.com/vi/${carouselVideo.url}/mqdefault.jpg`}
                      />
                      <h1 className="video-title">{videoTitle}</h1>
                    </a>
                  </div>
                </div>
              </div>
            );
          }
        })}
      </div>
    );
  }
}

export default CarouselVideos;
