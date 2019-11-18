import React, { Component } from "react";
import PropTypes from "prop-types";
import CarouselVideos from "./shared/CarouselVideos";
import { Pagination } from "semantic-ui-react";
import { LazyLoadImage } from "react-lazy-load-image-component";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import moment from "moment";
import * as Scroll from "react-scroll";
import "semantic-ui-css/semantic.min.css";
import videojs from "video.js";
import "video.js/dist/video-js.min.css";
import "videojs-youtube";

class HomeComponent extends Component {
  static propTypes = {
    videosInfo: PropTypes.object
  };

  constructor(props) {
    super(props);
    this.state = {
      videosInfo: props.videosInfo
    };
  }

  componentDidMount = () => {
    window.addEventListener("resize", this.updateDimensions);
  };
  componentWillUnmount = () => {
    window.removeEventListener("resize", this.updateDimensions);
  };

  updateDimensions = () => {
    let player = videojs("featureVideo");
    player.height(Math.round(document.body.clientWidth / 2.7));
  };

  handlePageChange = (e, { activePage }) => {
    const url = "/?page=" + activePage.toString();
    fetch(url, {
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
      });
    this.scrollToTopOfVideoGrid();
  };

  handleGridListClick = location => {
    window.location.href = location;
  };

  scrollToTopOfVideoGrid = () => {
    let scroll = Scroll.animateScroll;
    let gridOffsetTop = document.getElementsByClassName("MuiGridList-root")[0]
      .offsetTop;
    let featuredVideoHeight = document.getElementsByClassName("vjs-poster")[0]
      .offsetHeight;
    scroll.scrollTo(gridOffsetTop + featuredVideoHeight);
  };

  render() {
    const { videosInfo } = this.state;
    let featuredVideoHeight = document.body.clientWidth / 2.7;
    return (
      <div className="content">
        <div className="content-looping-video-div">
          <video
            playsInline
            autoPlay
            loop
            muted
            className="content-looping-video"
            src="https://d7vlh3kvn1ay8.cloudfront.net/background_video.mov"
          ></video>
        </div>
        <div className="col-xs-12 content-videos">
          <div className="content-videos-header">TRENDING AROUND THE WEB</div>
          <div className="col-xs-12">
            <CarouselVideos carouselVideos={videosInfo.trendingVideos} />
          </div>
          <div className="content-videos-header content-videos-header-featured">
            FEATURED VIDEO
          </div>
          <div className="col-xs-12">
            <div>
              <div className="col-xs-12">
                <video
                  id="featureVideo"
                  className="video-js vjs-default-skin featured-video"
                  controls
                  width="1200"
                  height={featuredVideoHeight}
                  data-setup='{ "techOrder": ["youtube", "html5"], "sources": [{ "type": "video/youtube", "src": "https://www.youtube.com/watch?v=WkJnvvBwDWY"}] }'
                ></video>
              </div>
            </div>
          </div>
          <div className="content-videos-header content-videos-header-featured">
            ALL VIDEOS
          </div>
          <GridList className="col-xs-12">
            {videosInfo.allVideos.map((video, index) => (
              <GridListTile
                className="content-videos-header-videos-section-item"
                key={index}
                onClick={() =>
                  this.handleGridListClick(
                    video.vimeo_video_id
                      ? `/watch?url=${video.url};title=${video.title};upload=true`
                      : `/watch?url=${video.url};title=${video.title};meta_data=${video.meta_data}`
                  )
                }
              >
                <div className="hover-effect">
                  <div className="view view-first">
                    <div className="masked">
                      {video.vimeo_video_id && (
                        <a
                          href={`/watch?url=${video.url};title=${video.title};upload=true`}
                        ></a>
                      )}
                      {!video.vimeo_video_id && (
                        <a
                          href={`/watch?url=${video.url};title=${video.title};meta_data=${video.meta_data}`}
                        ></a>
                      )}
                      {video.vimeo_video_id && (
                        <LazyLoadImage
                          alt={`${video.title}`}
                          height="auto"
                          src={`${video.thumb_nail}`}
                          width="100%"
                        />
                      )}
                      {!video.vimeo_video_id && (
                        <LazyLoadImage
                          alt={`${video.title}`}
                          height="auto"
                          src={`https://i.ytimg.com/vi/${video.url}/mqdefault.jpg`}
                          width="100%"
                        />
                      )}
                      <div className="video-title">{video.title}</div>
                      <div className="video-date-time">
                        {moment(video.date).format("MMM Do, YYYY")}
                      </div>
                    </div>
                  </div>
                </div>
              </GridListTile>
            ))}
          </GridList>
          <div className="col-xs-12">
            <Pagination
              onPageChange={this.handlePageChange}
              defaultActivePage={videosInfo.currentPage}
              siblingRange={3}
              size="mini"
              totalPages={videosInfo.totalPages}
            />
          </div>
        </div>
      </div>
    );
  }
}

export default HomeComponent;
