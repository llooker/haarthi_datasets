view: trip_time_prediction {
  sql_table_name: bike_trips.trip_time_prediction ;;

  dimension: intercept {
    type: number
    sql: ${TABLE}.Intercept ;;
    value_format_name: decimal_3
  }

  dimension: predictor {
    primary_key: yes
    type: string
    sql: ${TABLE}.Predictor ;;
  }

  dimension: x0 {
    type: number
    sql: ${TABLE}.X0 ;;
    value_format_name: decimal_3
  }

  dimension: x1 {
    type: number
    sql: ${TABLE}.X1 ;;
    value_format_name: decimal_3
  }

}
