import React from 'react'
import PropTypes from 'prop-types'
import ReactTable from 'react-table-v6'
import 'react-table-v6/react-table.css'

import { tableColumns } from './constants'

function Players(props) {
  return (
    <ReactTable
      data={props.data}
      columns={tableColumns}
      defaultPageSize={10}
      filterable
      className="-striped -highlight"
    />
  )
}

export default Players;
