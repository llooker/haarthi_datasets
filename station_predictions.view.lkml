view: station_prediction {
  sql_table_name: bike_trips.station_regression ;;

  dimension: bike_station {
    primary_key: yes
    type: string
    sql: ${TABLE}.bike_station ;;
  }

  dimension: start_intercept {
    type: number
    sql: ${TABLE}.start_intercept ;;
  }

  dimension: start_slope {
    type: number
    sql: ${TABLE}.start_slope ;;
  }

  dimension: end_intercept {
    type: number
    sql: ${TABLE}.end_intercept ;;
  }

  dimension: end_slope {
    type: number
    sql: ${TABLE}.end_slope ;;
  }

  # Trip Predictions
  measure:  start_predictions {
    type:  average
    sql: (${start_slope} * ${weather.temperature} ) +  ${start_intercept};;
    value_format_name: decimal_1
  }

  measure:  end_predictions {
    type:  average
    sql: (${end_slope} * ${weather.temperature} ) +  ${end_intercept};;
    value_format_name: decimal_1
  }

  measure:  predicted_station_overflow {
    type: number
    sql:  ${end_predictions} - ${start_predictions} ;;
    value_format_name: decimal_1
  }

  set: current_predictions {
    fields: [
      start_predictions,
      end_predictions,
      predicted_station_overflow
    ]

  }
}
