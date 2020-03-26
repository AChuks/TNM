import React, { Component } from "react";
import PropTypes from "prop-types";
import { LazyLoadImage } from "react-lazy-load-image-component";
import { Pagination } from "semantic-ui-react";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import moment from "moment";
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
          <GridList className="col-xs-12">
            {videosInfo.searchedVideos.map((video, index) => {
              if (
                video.meta_data ||
                video.is_irl ||
                (video.accepted && !video.is_irl)
              ) {
                return (
                  <GridListTile
                    className="content-videos-header-videos-section-item"
                    key={index}
                    onClick={() =>
                      this.handleGridListClick(
                        video.vimeo_video_id
                          ? `/watch?vid=${video.vimeo_video_id};upload=${true}`
                          : !video.vimeo_video_id && !video.is_irl
                          ? `/watch?url=${video.url};meta_data=${video.meta_data}`
                          : `/watch?url=${video.url};irl=${true}`
                      )
                    }
                  >
                    <div className="hover-effect">
                      <div className="view view-first">
                        <div className="masked">
                          {video.vimeo_video_id && (
                            <a
                              href={`/watch?vid=${video.vimeo_video_id};upload=true`}
                            >
                              <LazyLoadImage
                                alt={`${video.title}`}
                                height="auto"
                                src={`${video.thumb_nail}`}
                                width="100%"
                              />
                              <div className="video-title">{video.title}</div>
                              <div className="video-date-time">
                                {moment(video.date).format("MMM Do, YYYY")}
                              </div>
                            </a>
                          )}
                          {!video.vimeo_video_id && !video.is_irl && (
                            <a
                              href={`/watch?url=${video.url};meta_data=${video.meta_data}`}
                            >
                              <LazyLoadImage
                                alt={`${video.title}`}
                                height="auto"
                                src={`https://i.ytimg.com/vi/${video.url}/mqdefault.jpg`}
                                width="100%"
                              />
                              <div className="video-title">{video.title}</div>
                              <div className="video-date-time">
                                {moment(video.date).format("MMM Do, YYYY")}
                              </div>
                            </a>
                          )}
                          {video.is_irl && (
                            <a
                              href={`/watch?url=${video.url};irl=${true}`}
                            >
                              <LazyLoadImage
                                alt={`${video.title}`}
                                height="auto"
                                src={`https://i.ytimg.com/vi/${video.url}/mqdefault.jpg`}
                                width="100%"
                              />
                              <div className="video-title">{video.title}</div>
                              <div className="video-date-time">
                                {moment(video.date).format("MMM Do, YYYY")}
                              </div>
                            </a>
                          )}
                        </div>
                      </div>
                    </div>
                  </GridListTile>
                );
              }
            })}
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

export default SearchedVideos;
