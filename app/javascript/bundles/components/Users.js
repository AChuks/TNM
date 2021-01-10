import React, { Component } from "react";
import PropTypes from "prop-types";
import { BootstrapTable, TableHeaderColumn } from "react-bootstrap-table";
import { parseDate } from './shared/utils'
import "react-bootstrap-table/dist/react-bootstrap-table-all.min.css";

class Users extends Component {
  static propTypes = {
    users: PropTypes.array
  };

  constructor(props) {
    super(props);
    this.state = {
      users: props.users
    };
  }

  isExpandableRow = () => false;

  handleEditVideo = user => {
    window.location.href = `/users/${user.id}/edit`;
  };

  render() {
    const { users } = this.state;
    const options = {
      defaultSortName: "id",
      defaultSortOrder: "asc"
    };

    const dateTimeFormatter = cell => (
      <span>{parseDate(cell)}</span>
    );

    const idFormatter = (cell, row) => (
      <a
        style={{ cursor: "pointer" }}
        onClick={() => this.handleEditVideo(row)}
      >
        {cell}
      </a>
    );
    return (
      <div className="container-admin-users-content">
        <BootstrapTable
          ref={n => (this.userTableRef = n)}
          data={users}
          options={options}
          striped
          className="container-admin-users-content-table"
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
            dataField="user_name"
            dataSort
            width="10%"
            filter={{ type: "TextFilter" }}
          >
            Username
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="email"
            dataSort
            width="10%"
            filter={{ type: "TextFilter" }}
          >
            Email
          </TableHeaderColumn>

          <TableHeaderColumn
            dataField="super_admin"
            dataSort
            width="10%"
            filter={{ type: "TextFilter" }}
          >
            Super Admin
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
        </BootstrapTable>
      </div>
    );
  }
}

export default Users;
