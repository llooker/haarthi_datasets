view: weather_forecast {
  sql_table_name: bike_trips.weather_forecast ;;

  dimension: forecast_date_pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.forecast_date ;;
  }

  dimension_group: forecast {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: timestamp(${TABLE}.forecast_date);;
  }

  dimension: humidity {
    type: number
    sql: ${TABLE}.Humidity ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: temperature {
    type: number
    sql: ${TABLE}.Temperature ;;
  }

  dimension: wind {
    type: number
    sql: ${TABLE}.Wind ;;
  }
}
