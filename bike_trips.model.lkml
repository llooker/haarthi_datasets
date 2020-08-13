connection: "lookerdata_publicdata_standard_sql"


# include all the views
include: "*.view"

# include all the dashboards
#include: "*.dashboard"

datagroup: bikes_low {
  sql_trigger: select count(*) ;;
}

explore: trip {
  label: "Predictive Analytics"
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
    sql_on: ${trip.to_station_id} = ${end_station.station_id};;
  }

  join:  weather {
    relationship: many_to_one
    type: full_outer
    sql_on: ${trip.start_date} = ${weather.weather_date} ;;
  }

  join: station_prediction  {
    type:  left_outer
    relationship: one_to_one
    sql_on:  ${trip.from_station_id} = ${station_prediction.bike_station} ;;
  }

  join: trip_count_prediction {
    type: cross
    relationship: many_to_one
  }

#   join: from_to_trip {
#     type: left_outer
#     sql_on: ${start_station.station_id} = ${from_to_trip.trip_from_station_id} ;;
#   }
}


explore:  weather {
  join: station_prediction {
    relationship: one_to_many
    type: cross
  }

  join: trip_count_prediction {
    type: cross
    relationship: many_to_one
  }

  join:  station {
    relationship: one_to_one
    type: left_outer
    sql_on: ${station_prediction.bike_station} = ${station.station_id} ;;
  }
}
