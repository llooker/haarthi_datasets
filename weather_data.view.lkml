view: weather_data {
  sql_table_name: bike_trips.weather_data ;;

  dimension: forecast_pk {
    primary_key: yes
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



  dimension: temperature {
    type: number
    sql: ${TABLE}.Temperature ;;
  }

  dimension: wind {
    type: number
    sql: ${TABLE}.Wind ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
