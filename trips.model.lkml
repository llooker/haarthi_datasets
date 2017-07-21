connection: "lookerdata_publicdata_standard_sql"
label: "4) Bike Trips"
include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: trip {
  label: "Trips"
  fields: [ALL_FIELDS*, -trip.detail*]
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
    type: full_outer
    sql_on: ${trip.start_date} = ${weather.weather_date} ;;
  }

}
