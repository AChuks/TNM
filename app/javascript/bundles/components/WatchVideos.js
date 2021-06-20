import React, { Component, Suspense } from "react";
import PropTypes from "prop-types";
import { parseDate } from './shared/utils'
import VideoView from './VideoView';

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
    this.setState({documentLoaded:true});
  };

  initializeDisqus = () => {
    if (this.state.documentLoaded) {
      (function () {
        // DON'T EDIT BELOW THIS LINE
        var d = document,
          s = d.createElement("script");
        s.src = "//supercomedian.disqus.com/embed.js";
        s.setAttribute("data-timestamp", +new Date());
        (d.head || d.body).appendChild(s);
      })();
    }
  };

  handleGridListClick = location => {
    window.location.href = location;
  };

  render() {
    const { videosInfo, documentLoaded } = this.state;
    let videoClassName = "col-zero-padding div-video-watch ";
    let relatedVideosClassName = "col-zero-padding div-related-videos ";
    if (documentLoaded && window.innerWidth < 500) {
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
                <h1 className="video-title-watch">{videosInfo.title.replace(/<\/?[^>]+(>|$)/g, "")}
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
                    <VideoView videosInfo={videosInfo} />
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
              <ul className="MuiGridList-root col-xs-12">
                {videosInfo.relatedVideos.map((video, index) => {
                  let videoTitle = video.title.replace(/<\/?[^>]+(>|$)/g, "");
                  return (
                    <li
                      className="MuiGridListTile-root content-videos-header-videos-section-item"
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
                    <div className="MuiGridListTile-tile">
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
                              <img
                                alt={`${videoTitle}`}
                                height="auto"
                                src={`${video.thumb_nail}`}
                                width="100%"
                              />
                            )}
                            {!video.vimeo_video_id && (
                              <img
                                alt={`${videoTitle}`}
                                height="auto"
                                src={`https://i.ytimg.com/vi/${video.url}/mqdefault.jpg`}
                                width="100%"
                              />
                            )}
                            <div className="video-title">{videoTitle}</div>
                            <div className="video-date-time">
                                {parseDate(video.date)}
                            </div>
                            <div className='related-video-views'><i className="fa fa-eye"></i>&nbsp;{video.views} Views</div>
                          </div>
                        </div>
                      </div>
                      </div>
                    </li>
                  );
                })}
              </ul>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default WatchVideos;
