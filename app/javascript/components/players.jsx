import React from 'react'
import PropTypes from 'prop-types'
import ReactTable from 'react-table-v6'
import 'react-table-v6/react-table.css'

import { tableColumns } from './constants'

const makeDefaultState = () => ({
  sorted: [],
  filtered: []
});

class Players extends React.Component {
  constructor(props) {
    super(props)
    this.state = makeDefaultState()
    this.handleSubmit = this.handleSubmit.bind(this)
    this.resetState = this.resetState.bind(this)
  }

  handleSubmit(event) {
    // event.preventDefault();
  }

  resetState() {
    this.setState(makeDefaultState());
  }

  render() {
    return (
      <div>
        <code>
          <strong>this.state ===</strong>{" "}
          {JSON.stringify(this.state, null, 2)}
        </code>
        <div>
          <button onClick={this.resetState}>Reset Table State</button>
        </div>
        <ReactTable
          data={this.props.data}
          columns={tableColumns}
          defaultPageSize={10}
          sortable={false}
          filterable={false}
          className="-striped -highlight"
          sorted={this.state.sorted}
          onSortedChange={sorted => this.setState({ sorted })}
          filtered={this.state.filtered}
          onFilteredChange={filtered => this.setState({ filtered })}
        />

        {/* TODO: find a more element way to handle form submission */}
        <form action="/players/download_csv" method="get" onSubmit={this.handleSubmit}>
          <input type="hidden" name="sorted[attr_name]" value={this.state.sorted.length == 0 ? '' : this.state.sorted[0].id} />
          <input type="hidden" name="sorted[desc]" value={this.state.sorted.length == 0 ? '' : this.state.sorted[0].desc} />
          <input type="hidden" name="filtered[attr_name]" value={this.state.filtered.length == 0 ? '' : this.state.filtered[0].id} />
          <input type="hidden" name="filtered[search_value]" value={this.state.filtered.length == 0 ? '' : this.state.filtered[0].value} />
          <input type="submit" value="Download as CSV" />
        </form>
      </div>
    )
  }
}

export default Players;
