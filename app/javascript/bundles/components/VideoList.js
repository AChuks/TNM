import React from 'react';
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import { LazyLoadImage } from 'react-lazy-load-image-component';
import { parseDate } from './shared/utils'

function VideoList(props) {
    const parser = new DOMParser();
    return (
        <GridList className="col-xs-12">
        {props.videosInfo.allVideos.map((video, index) => {
            if (
                video.meta_data ||
                video.is_irl ||
                (video.accepted && (!video.is_irl || video.is_twitter))
            ) {
                let videoTitle = parser.parseFromString(video.title, "text/html").body.textContent;
                let videoDate = parseDate(video.date)
                return (        
                    <GridListTile
                        className="content-videos-header-videos-section-item"
                        key={index}
                    >
                        <div className="hover-effect">
                            <div className="view view-first">
                                <div className="masked" id={video.id}>
                                {video.vimeo_video_id && (
                                <a href={`/watch?vid=${video.vimeo_video_id}&upload=true`}>
                                    <LazyLoadImage
                                        alt={`${videoTitle}`}
                                        height="auto"
                                        src={`${video.thumb_nail}`}
                                        width="100%"
                                    />                        
                                        <div className="video-title">{videoTitle}</div>
                                        <div className="video-date-time">
                                            {videoDate}
                                        </div>
                                        <div className='video-views'><i className="fa fa-eye"></i>&nbsp;{video.views} Views</div>
                                </a>
                                )}
                                {video.is_twitter && (
                                    <a href={`/watch?id=${video.id}`}>
                                        <LazyLoadImage
                                            alt={`${videoTitle}`}
                                            height="auto"
                                            src={`${video.thumb_nail}`}
                                            width="100%"
                                        />
                                        <div className="video-title">{videoTitle}</div>
                                        <div className="video-date-time">
                                            {videoDate}
                                        </div>
                                        <div className='video-views'><i className="fa fa-eye"></i>&nbsp;{video.views} Views</div>
                                    </a>
                                )}
                                {!video.vimeo_video_id && !video.is_irl && !video.is_twitter && (
                                    <a href={`/watch?url=${video.url}&meta_data=${video.meta_data}`}>
                                        <LazyLoadImage
                                            alt={`${videoTitle}`}
                                            height="auto"
                                            src={`https://i.ytimg.com/vi/${video.url}/mqdefault.jpg`}
                                            width="100%"
                                        />  
                                        <h1 className="video-title">{videoTitle}</h1>
                                        <div className="video-date-time">
                                            {videoDate}
                                        </div>
                                        <div className='video-views'><i className="fa fa-eye"></i>&nbsp;{video.views} Views</div>
                                    </a>
                                )}
                                {video.is_irl && (
                                    <a href={`/watch?url=${video.url}&irl=${true}`}>
                                        <LazyLoadImage
                                            alt={`${videoTitle}`}
                                            height="auto"
                                            src={`https://i.ytimg.com/vi/${video.url}/mqdefault.jpg`}
                                            width="100%"
                                        />        
                                        <div className="video-title">{videoTitle}</div>
                                        <div className="video-date-time">
                                            {videoDate}
                                        </div>
                                        <div className='video-views'><i className="fa fa-eye"></i>&nbsp;{video.views} Views</div>
                                    </a>
                                )}
                            </div>
                        </div>
                    </div>
                </GridListTile>)
                }
            })}
        </GridList>
    );
}

export default VideoList