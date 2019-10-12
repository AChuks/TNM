import React, { Component } from "react";
import PropTypes from "prop-types";
import moment from "moment";
import { BootstrapTable, TableHeaderColumn } from "react-bootstrap-table";
import WatchVideo from "./shared/WatchVideo";

class Videos extends Component {
  static propTypes = {
    videos: PropTypes.array
  };

  constructor(props) {
    super(props);
    this.state = {
      videos: props.videos,
      showWatchVideoModal: false,
      currentVideo: null
    };
  }

  isExpandableRow = () => false;

  handleShowVideoModal = video => {
    this.setState({
      showWatchVideoModal: true,
      currentVideo: video
    });
  };

  handleHideVideoModal = () => {
    this.setState({ showWatchVideoModal: false, currentVideo: null });
  };

  handleEditVideo = video => {
    window.location.href = `/videos/${video.id}/edit`;
  };

  updateVideo = (id, type) => {
    const url = type === "videos" ? `/${type}/${id}` : `/${type}?id=${id}`;
    fetch(url, {
      method: `${type === "videos" ? "DELETE" : "GET"}`,
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      }
    })
      .then(res => res.json())
      .then(data => {
        this.setState({
          videos: data
        });
      });
  };

  handleVideoPropChange = (id, type) => {
    this.updateVideo(id, type);
  };

  render() {
    const { videos, showWatchVideoModal, currentVideo } = this.state;
    const options = {
      defaultSortName: "id",
      defaultSortOrder: "asc"
    };

    const dateTimeFormatter = cell => (
      <span>{moment(cell).format("MM/DD/YYYY HH:mm:ss")}</span>
    );
    const acceptedFormatter = (cell, row) => (
      <span>
        {cell ? "True" : "False"}
        <button
          className="btn btn-xs btn-info container-admin-videos-content-table-buttons"
          disabled={cell}
          onClick={() => this.handleVideoPropChange(row.id, "accept")}
        >
          Accept
        </button>
      </span>
    );
    const processedFormatter = (cell, row) => (
      <span>
        {cell ? "True" : "False"}
        <button
          className="btn btn-xs btn-info container-admin-videos-content-table-buttons"
          disabled={cell}
          onClick={() => this.handleVideoPropChange(row.id, "processed")}
        >
          Mark as Processed
        </button>
      </span>
    );
    const deletedFormatter = (cell, row) => (
      <span>
        {cell ? "True" : "False"}
        <button
          className="btn btn-xs btn-info container-admin-videos-content-table-buttons"
          disabled={cell}
          onClick={() => this.handleVideoPropChange(row.id, "videos")}
        >
          Delete
        </button>
      </span>
    );
    const watchVideoFormatter = (cell, row) => (
      <button
        className="btn btn-xs btn-info container-admin-videos-content-table-buttons"
        onClick={() => this.handleShowVideoModal(row)}
      >
        Watch Video
      </button>
    );

    const idFormatter = (cell, row) => (
      <a
        style={{ cursor: "pointer" }}
        onClick={() => this.handleEditVideo(row)}
      >
        {cell}
      </a>
    );
    console.log(videos);
    return (
      <div className="container-admin-videos-content">
        {showWatchVideoModal && (
          <WatchVideo
            closeCallback={this.handleHideVideoModal}
            currentVideo={currentVideo}
          />
        )}
        <BootstrapTable
          ref={n => (this.videoTableRef = n)}
          data={videos}
          options={options}
          striped
          className="container-admin-videos-content-table"
          expandableRow={this.isExpandableRow}
          expandColumnOptions={{
            expandColumnComponent: this.expandColumnComponent,
            columnWidth: 50
          }}
        >
          <TableHeaderColumn
            dataSort
            dataField="id"
            dataFormat={idFormatter}
            isKey
            width="5%"
          >
            ID
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="title"
            dataSort
            width="10%"
            filter={{ type: "TextFilter" }}
          >
            Title
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="description"
            dataSort
            width="10%"
            filter={{ type: "TextFilter" }}
          >
            Description
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="author_email"
            dataSort
            width="10%"
            filter={{ type: "TextFilter" }}
          >
            Author Email
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="url"
            dataSort
            width="15%"
            filter={{ type: "TextFilter" }}
          >
            URL
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="processed"
            dataSort
            width="15%"
            filter={{ type: "TextFilter" }}
            dataFormat={processedFormatter}
          >
            Processed
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="accepted"
            dataSort
            width="10%"
            filter={{ type: "TextFilter" }}
            dataFormat={acceptedFormatter}
          >
            Accepted
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="deleted"
            dataSort
            width="10%"
            filter={{ type: "TextFilter" }}
            dataFormat={deletedFormatter}
          >
            Deleted
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="created_at"
            dataSort
            width="15%"
            dataFormat={dateTimeFormatter}
          >
            Created
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="updated_at"
            dataSort
            width="15%"
            dataFormat={dateTimeFormatter}
          >
            Updated
          </TableHeaderColumn>
          <TableHeaderColumn
            dataSort
            width="10%"
            dataFormat={watchVideoFormatter}
          >
            Watch Video
          </TableHeaderColumn>
        </BootstrapTable>
      </div>
    );
  }
}

export default Videos;
