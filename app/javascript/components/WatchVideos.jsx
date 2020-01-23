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
    let player = videojs("watchVideo");
    player.height(Math.round(document.body.clientWidth / 2.7));
  };

  initializeDisqus = () => {
    (function() {
      // DON'T EDIT BELOW THIS LINE
      var d = document,
        s = d.createElement("script");
      s.src = "//supercomedian.disqus.com/embed.js";
      s.setAttribute("data-timestamp", +new Date());
      (d.head || d.body).appendChild(s);
    })();
  };

  handleScroll = () => {
    console.log("scrolling");
    var relatedVideo = document.getElementsByClassName("MuiGridList-root")[0];
    var disqusThread = document.getElementsByClassName("disqus-thread")[0];
    if (
      relatedVideo &&
      disqusThread &&
      relatedVideo.offsetHeight !== disqusThread.scrollHeight
    ) {
      console.log(disqusThread.scrollHeight);
      relatedVideo.style.height = disqusThread.scrollHeight + "px";
    }
  };

  handleGridListClick = location => {
    window.location.href = location;
  };

  render() {
    const { videosInfo } = this.state;
    const parser = new DOMParser();
    return (
      <div className="content">
        <div className="col-xs-12 content-videos content-videos-watch">
          <div className="col-xs-12 col-zero-padding">
            <div className="col-xs-9 col-zero-padding">
              <div className="col-xs-12 col-zero-padding">
                <div className="video-title-watch">{parser.parseFromString(
                  videosInfo.title, "text/html")
                  .body.textContent}</div>
                {videosInfo.uploaded && (
                  <div
                    dangerouslySetInnerHTML={{
                      __html: videosInfo.currentVideo.frame
                    }}
                  />
                )}
                {!videosInfo.uploaded && (
                  <div className="col-xs-12 col-zero-padding">
                    {/* <video
                      id="watchVideo"
                      autoPlay={true}
                      className="video-js vjs-default-skin featured-video"
                      controls
                      width="1200"
                      height="700"
                      data-setup={JSON.stringify({
                        techOrder: ["youtube", "html5"],
                        sources: [
                          {
                            type: "video/youtube",
                            src: `https://www.youtube.com/watch?v=${videosInfo.url}`
                          }
                        ]
                      })}
                    ></video> */}
                    <iframe
                      id="watchVideo"
                      className="iframe-watch-video"
                      width="100%"
                      height="100%"
                      src={`https://www.youtube.com/embed/${videosInfo.url}?autoplay=1&mute=1`}
                      start="1"
                      frameBorder="0"
                      allow="accelerometer; autoPlay; encrypted-media; gyroscope; picture-in-picture"
                      allowFullScreen
                    ></iframe>
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
            <div className="col-xs-3 col-zero-padding">
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
                            ? `/watch?url=${video.url};title=${videoTitle};upload=true`
                            : `/watch?url=${video.url};title=${videoTitle};meta_data=${video.meta_data}`
                        )
                      }
                    >
                      <div className="hover-effect">
                        <div className="view view-first">
                          <div className="masked">
                            {video.vimeo_video_id && (
                              <a
                                href={`watch?url=${video.url};title=${videoTitle};upload=true`}
                              ></a>
                            )}
                            {!video.vimeo_video_id && (
                              <a
                                href={`watch?url=${video.url};title=${videoTitle};meta_data=${video.meta_data}`}
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
