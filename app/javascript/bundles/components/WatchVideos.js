import React, { Component } from "react";
import PropTypes from "prop-types";
import { LazyLoadImage } from "react-lazy-load-image-component";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import moment from "moment";
import videojs from "video.js";
import "video.js/dist/video-js.min.css";
import "videojs-youtube";

class WatchVideos extends Component {
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
    window.addEventListener("scroll", this.handleScroll);
    this.updateDimensions();
  };

  componentWillUnmount = () => {
    window.removeEventListener("resize", this.updateDimensions);
    window.removeEventListener("scroll", this.handleScroll);
  };

  updateDimensions = () => {
    if (!this.state.videosInfo.uploaded) {
      let player = videojs("watchVideo");
      player.height(Math.round(document.body.clientWidth / 2.7));
    }
    let watchVideoDiv = document.getElementsByClassName('div-video-watch')
    let relatedVideosDiv = document.getElementsByClassName('div-related-videos')
    if (watchVideoDiv && watchVideoDiv[0] && window.innerWidth < 500) {
      watchVideoDiv[0].classList.remove("col-xs-8")
      watchVideoDiv[0].classList.add("col-xs-12")
      relatedVideosDiv[0].classList.remove("col-xs-4")
      relatedVideosDiv[0].classList.add("col-xs-12")
    } else {
      watchVideoDiv[0].classList.add("col-xs-8")
      watchVideoDiv[0].classList.remove("col-xs-12")
      relatedVideosDiv[0].classList.add("col-xs-4")
      relatedVideosDiv[0].classList.remove("col-xs-12")
    }
  };

  initializeDisqus = () => {
    (function () {
      // DON'T EDIT BELOW THIS LINE
      var d = document,
        s = d.createElement("script");
      s.src = "//supercomedian.disqus.com/embed.js";
      s.setAttribute("data-timestamp", +new Date());
      (d.head || d.body).appendChild(s);
    })();
  };

  handleScroll = () => {
    var relatedVideo = document.getElementsByClassName("MuiGridList-root")[0];
    var disqusThread = document.getElementsByClassName("disqus-thread")[0];
    if (
      relatedVideo &&
      disqusThread &&
      relatedVideo.offsetHeight !== disqusThread.scrollHeight
    ) {
      relatedVideo.style.height = disqusThread.scrollHeight + "px";
    }
  };

  handleGridListClick = location => {
    window.location.href = location;
  };

  render() {
    const { videosInfo } = this.state;
    const parser = new DOMParser();
    let videoClassName = "col-zero-padding div-video-watch ";
    let relatedVideosClassName = "col-zero-padding div-related-videos ";
    if (window.innerWidth < 500) {
      videoClassName = videoClassName + "col-xs-12";
      relatedVideosClassName = relatedVideosClassName + "col-xs-12";
    } else {
      videoClassName = videoClassName + "col-xs-8";
      relatedVideosClassName = relatedVideosClassName + "col-xs-4"
    }
    return (
      <div className="content">
        <div className="col-xs-12 content-videos content-videos-watch">
          <div className="col-xs-12 col-zero-padding">
            <div className={videoClassName}>
              <div className="col-xs-12 col-zero-padding">
                <h1 className="video-title-watch">{parser.parseFromString(
                  videosInfo.title, "text/html")
                  .body.textContent}
                </h1>
                {videosInfo.uploaded && (
                  <div
                    dangerouslySetInnerHTML={{
                      __html: videosInfo.currentVideo.frame
                    }}
                  />
                )}
                {!videosInfo.uploaded && (
                  <div className="col-xs-12 col-zero-padding">
                    <video
                      id="watchVideo"
                      autoPlay={true}
                      className="video-js vjs-default-skin featured-video"
                      controls
                      width="1200"
                      height="700"
                      data-setup={JSON.stringify({
                        techOrder: videosInfo.currentVideo.is_twitter ? undefined : ["youtube", "html5"],
                        sources: [
                          {
                            type: videosInfo.currentVideo.is_twitter ? "video/mp4" : "video/youtube",
                            src: videosInfo.currentVideo.is_twitter ? videosInfo.url : `https://www.youtube.com/watch?v=${videosInfo.url}`
                          }
                        ],
                        "youtube": { "ytControls": 1}
                      })}
                    ></video>
                    {/* <iframe
                      id="watchVideo"
                      className="iframe-watch-video"
                      width="100%"
                      height="100%"
                      src={`https://www.youtube.com/embed/${videosInfo.url}?autoplay=1&mute=0`}
                      start="1"
                      frameBorder="0"
                      allow="accelerometer; autoPlay; encrypted-media; gyroscope; picture-in-picture"
                      allowFullScreen
                    ></iframe> */}
                    <div className='video-views'><i className="fa fa-eye"></i>&nbsp;&nbsp;{videosInfo.views} Views</div>
                  </div>
                )}
              </div>
              <div id="disqus_thread" className="disqus-thread"></div>
              <script
                id="dsq-count-scr"
                src="//supercomedian.disqus.com/count.js"
                async
              ></script>
              <script>{this.initializeDisqus()}</script>
              <noscript>
                Please enable JavaScript to view the{" "}
                <a href="https://disqus.com/?ref_noscript">
                  comments powered by Disqus.
                </a>
              </noscript>
            </div>
            <div className="col-xs-4 col-zero-padding div-related-videos">
              <div className="content-videos-header content-videos-header-related">
                Related Videos
              </div>
              <GridList className="col-xs-12">
                {videosInfo.relatedVideos.map((video, index) => {
                  let videoTitle = parser.parseFromString(
                    video.title, "text/html")
                    .body.textContent;
                  return (
                    <GridListTile
                      className="content-videos-header-videos-section-item"
                      key={index}
                      onClick={() =>
                        this.handleGridListClick(
                          video.vimeo_video_id
                            ? `/watch?vid=${video.vimeo_video_id}&upload=true`
                            : !video.vimeo_video_id && !video.is_irl
                              ? `/watch?url=${video.url}&meta_data=${video.meta_data}`
                              : `/watch?url=${video.url}&irl=${true}`
                        )
                      }
                    >
                      <div className="hover-effect">
                        <div className="view view-first">
                          <div className="masked">
                            {video.vimeo_video_id && (
                              <a
                                href={`watch?vid=${video.vimeo_video_id}&upload=true`}
                              ></a>
                            )}
                            {!video.vimeo_video_id && !video.is_irl && (
                              <a
                                href={`watch?url=${video.url}&meta_data=${video.meta_data}`}
                              ></a>
                            )}
                            {video.is_irl && (
                              <a
                                href={`watch?url=${video.url}&irl=${true}`}
                              ></a>
                            )}
                            {video.vimeo_video_id && (
                              <LazyLoadImage
                                alt={`${videoTitle}`}
                                height="auto"
                                src={`${video.thumb_nail}`}
                                width="100%"
                              />
                            )}
                            {!video.vimeo_video_id && (
                              <LazyLoadImage
                                alt={`${videoTitle}`}
                                height="auto"
                                src={`https://i.ytimg.com/vi/${video.url}/mqdefault.jpg`}
                                width="100%"
                              />
                            )}
                            <div className="video-title">{videoTitle}</div>
                            <div className="video-date-time">
                                {moment(video.date).format("MMM Do, YYYY")}
                            </div>
                            <div className='related-video-views'><i className="fa fa-eye"></i>&nbsp;{video.views} Views</div>
                          </div>
                        </div>
                      </div>
                    </GridListTile>
                  );
                })}
              </GridList>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default WatchVideos;
