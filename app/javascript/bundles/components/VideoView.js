import React, { Component } from "react";
import videojs from "video.js";
import "video.js/dist/video-js.min.css";
import "videojs-youtube";

class VideoView extends Component {
    constructor(props) {
        super(props);
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

    updateDimensions = () => {
        if (!this.props.videosInfo.uploaded) {
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
    render() {
        return (
            <video
                id="watchVideo"
                autoPlay={true}
                className="video-js vjs-default-skin featured-video"
                controls
                width="1200"
                height="700"
                data-setup={JSON.stringify({
                    techOrder: this.props.videosInfo.currentVideo.is_twitter ? undefined : ["youtube", "html5"],
                    sources: [
                    {
                        type: this.props.videosInfo.currentVideo.is_twitter ? "video/mp4" : "video/youtube",
                        src: this.props.videosInfo.currentVideo.is_twitter ? this.props.videosInfo.url : `https://www.youtube.com/watch?v=${this.props.videosInfo.url}`
                    }   
                ],
                "youtube": { "ytControls": 1}
                })}
        > 
        </video>
        );
    }
}

export default VideoView