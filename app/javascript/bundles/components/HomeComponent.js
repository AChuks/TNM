import React, { Component, Suspense } from "react";
import PropTypes from "prop-types";
import * as Scroll from "react-scroll";
import "semantic-ui-css/semantic.min.css";
import Loadable from 'react-loadable';

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
    let responsiveHeight = Math.round(document.body.clientWidth / 2.7);
    // Update videojs height
    // let player = videojs("featureVideo");
    // player.height(responsiveHeight);
    // player.tech.removeControlsListeners();

    // Update iFrame video height
    let iFramePlayer = document.getElementsByClassName("featured-video");
    if (iFramePlayer[0]) {
      iFramePlayer[0].style.height = responsiveHeight + "px";
    }
  };

  handlePageChange = (e, { activePage }) => {
    let url = "/?page=" + activePage.toString();
    window.location.href = url;
  };

  handleGridListClick = location => {
    window.location.href = location;
  };

  handleFeaturedVideoClick = () => {
    // window.location.href = '/watch?url=AU1woNn0b9g&irl=true';
    window.location.href = '/watch?url=NdeHE1nQBf8&meta_data=UCxAkiUiL3KnMl0BIFBv6xxA';
  }

  scrollToTopOfVideoGrid = () => {
    let scroll = Scroll.animateScroll;
    let gridOffsetTop = document.getElementsByClassName("MuiGridList-root")[0]
      .offsetTop;
    let featuredVideoHeight = document.getElementsByClassName("featured-video")[0]
      .offsetHeight;
    scroll.scrollTo(gridOffsetTop + featuredVideoHeight);
  };

  render() {
    const { videosInfo } = this.state;
    let featuredVideoHeight = document.body.clientWidth / 2.7;

    const VideoListComponent = React.lazy(() =>
      import(`./VideoList`)
    );

    const PaginationComponent = React.lazy(() =>
      import(`./Pagination`)
    );


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
            // src="https://sc-assets-test.s3.amazonaws.com/background_video.mov"
            controlsList="nodownload"
          ></video>
          {/* <div className="content-looping-video-overlay">
            <h2 className='originals'>Win <strong>N15,000</strong> Daily In Our Featured Video's Comments Giveaway. <a href='/giveaway'>Click Here To Learn How!</a></h2>
          </div> */}
        </div>
        <div className="col-xs-12 content-videos">
          {/* <div className="content-videos-header">TRENDING</div> */}
          {/* <div className="col-xs-12">
            <CarouselVideos carouselVideos={videosInfo.trendingVideos} />
          </div> */}
          <div className="content-videos-header content-videos-header-featured" onClick={this.handleFeaturedVideoClick}>
            FEATURED VIDEO
          </div>
          <div className="col-xs-12" onClick={this.handleFeaturedVideoClick}>
            <div>
              <div className="col-xs-12">
                <img src='https://img.youtube.com/vi/NdeHE1nQBf8/mqdefault.jpg' style={{ height: 'inherit', width: 'inherit', cursor: 'pointer' }} />
                <h1 className="video-title">NEW YEAR COMPILATION FROM MR MACARONI</h1>
                {/* <video
                  id="featureVideo"
                  className="video-js vjs-default-skin featured-video"
                  controls
                  width="1200"
                  height={featuredVideoHeight}
                  data-setup='{ "techOrder": ["youtube", "html5"], "sources": [{ "type": "video/youtube", "src": "https://www.youtube.com/watch?v=lpjXMs_YmZY" }], "youtube": { "ytControls": 1} }'
                ></video> */}
                {/* <iframe
                  className="featured-video"
                  width="1200"
                  height={featuredVideoHeight}
                  src="https://www.youtube.com/embed/DS6b6X5dsN4"
                  frameBorder="0"
                  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                  allowFullScreen
                ></iframe> */}
              </div>
            </div>
          </div>
          <div className="content-videos-header content-videos-header-featured">
            ALL VIDEOS
          </div>
          <Suspense fallback={<div>Loading...</div>}>
            <VideoListComponent videosInfo={videosInfo}/>   
          </Suspense>     
          <div className="col-xs-12">
              <Suspense fallback={<div>Loading...</div>}>
                <PaginationComponent handlePageChange={this.handlePageChange} videosInfo={videosInfo}/>
              </Suspense>
          </div>
        </div>
      </div>
    );

  }
}

export default HomeComponent;
