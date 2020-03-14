export const tableColumns = [
  {
    Header: 'Player Name',
    accessor: 'name',
    filterable: true,
    filterMethod: (filter, row) => {
      const search_str = filter.value.charAt(0).toUpperCase() + filter.value.slice(1).toLowerCase()
      return row[filter.id].search(search_str) != -1
    }
  },
  {
    Header: 'Team',
    accessor: 'team',
    // filterMethod: (filter, row) =>
    //   String(row[filter.id]) === filter.value ||
    //   String(row[filter.id]).toUpperCase() === filter.value
  },
  {
    Header: 'Pos',
    accessor: 'position',
    // filterMethod: (filter, row) => 
    //   String(row[filter.id]) === filter.value ||
    //   String(row[filter.id]).toUpperCase() === filter.value
  },
  {
    Header: 'Att/G',
    accessor: 'attempts_per_game',
  },
  {
    Header: 'Att',
    accessor: 'attempts',
  },
  {
    Header: 'Yds',
    accessor: 'rushing_yds_total',
    sortable: true,
  },
  {
    Header: 'Avg',
    accessor: 'rushing_yds_per_attempt',
  },
  {
    Header: 'Yds/G',
    accessor: 'rushing_yds_per_game',
  },
  {
    Header: 'TD',
    accessor: 'touch_down',
    sortable: true,
  },
  {
    Header: 'Lng',
    accessor: 'longest_rush',
    sortable: true,
  },
  {
    Header: '1st',
    accessor: 'first_down',
  },
  {
    Header: '1st%',
    accessor: 'first_down_pct',
  },
  {
    Header: '20+',
    accessor: 'twenty_yards',
  },
  {
    Header: '40+',
    accessor: 'forth_yards',
  },
  {
    Header: "FUM",
    accessor: 'fumbles',
  },
]
