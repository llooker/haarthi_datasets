connection: "haarthi-bigquery"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"
explore: weather {}

explore: trip {
  join: start_station {
    from: station
    relationship: many_to_one
    type: left_outer
    sql_on: ${trip.from_station_id} = ${start_station.station_id};;
  }

  join: end_station {
    from: station
    relationship: many_to_one
    type: left_outer
    sql_on: ${trip.from_station_id} = ${end_station.station_id};;
  }

  join:  weather {
    relationship: many_to_one
    type: left_outer
    sql_on: ${trip.start_date} = ${weather.weather_date} ;;
  }
}
