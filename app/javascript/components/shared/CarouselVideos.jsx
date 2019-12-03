import React, { Component } from "react";
import PropTypes from "prop-types";
import { LazyLoadImage } from "react-lazy-load-image-component";

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
    return (
      <div className="owl-carousel owl-theme">
        {carouselVideos.map((carouselVideo, index) => (
          <div
            className="hover-effect"
            style={{ width: "280px", paddingLeft: "20px" }}
            key={index}
          >
            <div className="view view-first carou-img">
              <div className="masked">
                <a
                  href={`watch?url=${carouselVideo.url};title=${carouselVideo.title};meta_data=${carouselVideo.meta_data}`}
                >
                  <LazyLoadImage
                    alt={`${carouselVideo.title}`}
                    height="auto"
                    src={`https://i.ytimg.com/vi/${carouselVideo.url}/hqdefault.jpg`}
                    width="100%"
                  />
                  <div className="video-title">{carouselVideo.title}</div>
                </a>
              </div>
            </div>
          </div>
        ))}
      </div>
    );
  }
}

export default CarouselVideos;
