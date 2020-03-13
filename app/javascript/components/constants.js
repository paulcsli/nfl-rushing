export const tableColumns = [
  {
    Header: 'Player Name',
    accessor: 'name',
    filterMethod: (filter, row) => {
      const search_str = filter.value.charAt(0).toUpperCase() + filter.value.slice(1).toLowerCase()
      return row[filter.id].startsWith(search_str)
    }
  },
  {
    Header: 'Team',
    accessor: 'team',
    filterMethod: (filter, row) =>
      String(row[filter.id]) === filter.value ||
      String(row[filter.id]).toUpperCase() === filter.value
  },
  {
    Header: 'Pos',
    accessor: 'position',
    filterMethod: (filter, row) => 
      String(row[filter.id]) === filter.value ||
      String(row[filter.id]).toUpperCase() === filter.value
  },
  {
    Header: 'Att/G',
    accessor: 'attempts_per_game',
    filterable: false,
  },
  {
    Header: 'Att',
    accessor: 'attempts',
    filterable: false,
  },
  {
    Header: 'Yds',
    accessor: 'rushing_yds_total',
    filterable: false,
  },
  {
    Header: 'Avg',
    accessor: 'rushing_yds_per_attempt',
    filterable: false,
  },
  {
    Header: 'Yds/G',
    accessor: 'rushing_yds_per_game',
    filterable: false,
  },
  {
    Header: 'TD',
    accessor: 'touch_down',
    filterable: false,
  },
  {
    Header: 'Lng',
    accessor: 'longest_rush',
    filterable: false,
  },
  {
    Header: '1st',
    accessor: 'first_down',
    filterable: false,
  },
  {
    Header: '1st%',
    accessor: 'first_down_pct',
    filterable: false,
  },
  {
    Header: '20+',
    accessor: 'twenty_yards',
    filterable: false,
  },
  {
    Header: '40+',
    accessor: 'forth_yards',
    filterable: false,
  },
  {
    Header: "FUM",
    accessor: 'fumbles',
    filterable: false,
  },
]
