import React, { Component } from "react";
import PropTypes from "prop-types";
import { Pagination } from "semantic-ui-react";
import { parseDate } from './shared/utils'
import * as Scroll from "react-scroll";

class SearchedVideos extends Component {
  static propTypes = {
    videosInfo: PropTypes.object
  };

  constructor(props) {
    super(props);
    this.state = {
      videosInfo: props.videosInfo
    };
  }

  handlePageChange = (e, { activePage }) => {
    const { videosInfo } = this.state;
    const url =
      "/pages?page=" +
      activePage.toString() +
      `&search_text=${videosInfo.searchedText}`;
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

  scrollToTopOfVideoGrid = () => {
    let scroll = Scroll.animateScroll;
    let gridOffsetTop = document.getElementsByClassName("MuiGridList-root")[0]
      .offsetTop;
    scroll.scrollTo(gridOffsetTop);
  };

  handleGridListClick = location => {
    window.location.href = location;
  };

  render() {
    const { videosInfo } = this.state;
    return (
      <div className="content">
        <div className="col-xs-12 content-videos">
          <div className="content-videos-header content-videos-header-searched">
            {`ALL "${videosInfo.searchedText}" VIDEOS`}
          </div>
          <ul className="MuiGridList-root col-xs-12">
            {videosInfo.searchedVideos.map((video, index) => {
              if (
                video.meta_data ||
                video.is_irl ||
                (video.accepted && !video.is_irl)
              ) {
                let videoDate = parseDate(video.date)
                return (
                  <li
                    className="MuiGridListTile-root content-videos-header-videos-section-item"
                    key={index}
                    // onClick={() =>
                    //   this.handleGridListClick(
                    //     video.vimeo_video_id
                    //       ? `/watch?vid=${video.vimeo_video_id}&upload=${true}`
                    //       : !video.vimeo_video_id && !video.is_irl
                    //       ? `/watch?url=${video.url}&meta_data=${video.meta_data}`
                    //       : `/watch?url=${video.url}&irl=${true}`
                    //   )
                    // }
                  >
                  <div className="MuiGridListTile-tile">
                    <div className="hover-effect">
                      <div className="view view-first">
                        <div className="masked">
                          {video.vimeo_video_id && (
                            <a
                              href={`/watch?vid=${video.vimeo_video_id}&upload=true`}
                            >
                              <img
                                alt={`${video.title}`}
                                height="auto"
                                src={`${video.thumb_nail}`}
                                width="100%"
                              />
                              <div className="video-title">{video.title}</div>
                              <div className="video-date-time">
                                {videoDate}
                              </div>
                              <div className='video-views'><i className="fa fa-eye"></i>&nbsp;{video.views} Views</div>
                            </a>
                          )}
                          {!video.vimeo_video_id && !video.is_irl && (
                            <a
                              href={`/watch?url=${video.url}&meta_data=${video.meta_data}`}
                            >
                              <img
                                alt={`${video.title}`}
                                height="auto"
                                src={`https://i.ytimg.com/vi/${video.url}/mqdefault.jpg`}
                                width="100%"
                              />
                              <div className="video-title">{video.title}</div>
                              <div className="video-date-time">
                                {videoDate}
                              </div>
                              <div className='video-views'><i className="fa fa-eye"></i>&nbsp;{video.views} Views</div>
                            </a>
                          )}
                          {video.is_irl && (
                            <a
                              href={`/watch?url=${video.url}&irl=${true}`}
                            >
                              <img
                                alt={`${video.title}`}
                                height="auto"
                                src={`https://i.ytimg.com/vi/${video.url}/mqdefault.jpg`}
                                width="100%"
                              />
                              <div className="video-title">{video.title}</div>
                              <div className="video-date-time">
                                {videoDate}
                              </div>
                              <div className='video-views'><i className="fa fa-eye"></i>&nbsp;{video.views} Views</div>
                            </a>
                          )}
                        </div>
                      </div>
                    </div>
                    </div>
                  </li>
                );
              }
            })}
          </ul>
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

export default SearchedVideos;
