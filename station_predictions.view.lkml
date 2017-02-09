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

  measure:  start_predictions {
    type:  average
    sql: (${start_slope} * ${weather.mean_temperature_f} ) +  ${start_intercept};;
    value_format_name: decimal_1
  }

  measure:  end_predictions {
    type:  average
    sql: (${end_slope} * ${weather.mean_temperature_f} ) +  ${end_intercept};;
    value_format_name: decimal_1
  }

  measure:  station_overflow {
    type: number
    sql:  ${end_predictions} - ${start_predictions} ;;
    value_format_name: decimal_1
  }


  # For Weather Predictions

  measure:  start_predictions_forecast {
    type:  average
    sql: (${start_slope} * ${weather_forecast.temperature} ) +  ${start_intercept};;
    value_format_name: decimal_1
  }

  measure:  end_predictions_forecast {
    type:  average
    sql: (${end_slope} * ${weather_forecast.temperature} ) +  ${end_intercept};;
    value_format_name: decimal_1
  }

  measure:  station_overflow_forecast {
    type: number
    sql:  ${end_predictions_forecast} - ${start_predictions_forecast} ;;
    value_format_name: decimal_1
  }

  set: current_predictions {
    fields: [
      start_predictions,
      end_predictions,
      station_overflow
    ]
  }

  set: forecast_predictions {
    fields: [
      start_predictions_forecast,
      end_predictions_forecast,
      station_overflow_forecast
    ]
  }
}
