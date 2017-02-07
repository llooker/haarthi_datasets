view: station_regression {
  sql_table_name: bike_trips.station_regression ;;

  dimension: bike_station {
    primary_key: yes
    type: string
    sql: ${TABLE}.bike_station ;;
  }

  dimension: intercept {
    type: number
    sql: ${TABLE}.intercept ;;
  }

  dimension: slope {
    type: number
    sql: ${TABLE}.slope ;;
  }

  dimension:  predictions {
    type:  number
    sql:  (${slope} * ${weather.mean_temperature_f} ) +  ${intercept};;
  }

  measure:  my_predictions {
    type:  sum
    sql: (${slope} * ${weather.mean_temperature_f}) + ${intercept} ;;
  }

#   dimension:  predictions {
#     type:  number
#     sql:  (${slope} * ${weather_data.temperature} ) +  ${intercept};;
#   }
#
#   measure:  my_predictions {
#     type:  sum
#     sql: (${slope} * ${weather_data.temperature}) + ${intercept} ;;
#   }

  measure: count {
    type: count
    drill_fields: []
  }
}
