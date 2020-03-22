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
        {carouselVideos.filter(carouselVideo => {return carouselVideo.meta_data ||
            carouselVideo.is_irl ||
            (carouselVideo.accepted && !carouselVideo.is_irl)})
            .map((carouselVideo, index) => {
         
            let img = `https://i.ytimg.com/vi/${carouselVideo.url}/mqdefault.jpg`;
            let videoTitle = carouselVideo.title && parser.parseFromString(
              carouselVideo.title,
              "text/html"
            ).body.textContent;
            let url = `/watch?url=${carouselVideo.url};meta_data=${carouselVideo.meta_data}`;
            if (carouselVideo.vimeo_video_id) {
              url = `/watch?vid=${carouselVideo.vimeo_video_id};upload=true`;
              img = carouselVideo.thumb_nail;
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
                        src={img}
                      />
                      <h1 className="video-title">{videoTitle || ''}</h1>
                    </a>
                  </div>
                </div>
              </div>
            );
        })}
      </div>
    );
  }
}

export default CarouselVideos;
