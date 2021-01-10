import React from 'react';
import { Pagination as Page} from "semantic-ui-react";
import "semantic-ui-css/semantic.min.css";

function Pagination (props) {
  return (
    <Page
      onPageChange={props.handlePageChange}
      defaultActivePage={props.videosInfo && props.videosInfo.currentPage}
      siblingRange={3}
      size="mini"
      totalPages={props.videosInfo && props.videosInfo.totalPages}
    />      
  );
}

export default Pagination