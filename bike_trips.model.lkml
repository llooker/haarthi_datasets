connection: "haarthi-bigquery"


# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

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

  join: station_prediction  {
    type:  left_outer
    relationship: one_to_one
    sql_on:  ${trip.from_station_id} = ${station_prediction.bike_station} ;;
    fields: [current_predictions*]
  }

  join: trip_time_prediction {
    type: cross
    relationship: many_to_one
  }
}


# explore:  weather {
#   from: weather_forecast
#   view_label: "Future Weather Forecasts"
#
#   join: station_prediction {
#     relationship: one_to_many
#     type: cross
#     fields: [forecast_predictions*]
#   }
#
#   join: trip_time_prediction {
#     type: cross
#     relationship: many_to_one
#   }
#
#   join:  station {
#     relationship: one_to_one
#     type: left_outer
#     sql_on: ${station_prediction.bike_station} = ${station.station_id} ;;
#   }
# }
