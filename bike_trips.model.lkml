connection: "haarthi-bigquery"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"
# explore: weather {}

explore: trip {
  join: start_station {
    from: station
    relationship: many_to_one
    type: left_outer
    sql_on: ${trip.from_station_id} = ${start_station.station_id};;
  }

  join: station_regression  {
    type:  left_outer
    relationship: one_to_one
    sql_on:  ${start_station.station_id} = ${station_regression.bike_station} ;;
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


# explore:  weather_forecast {
#   join:  station_regression {
#     relationship: one_to_many
#     type: cross
#   }

# }
