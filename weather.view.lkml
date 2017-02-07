view: weather {
  sql_table_name: bike_trips.weather ;;
  dimension_group: weather {
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
    sql: timestamp(${TABLE}.weather_date);;
  }

  dimension: weather {
    type:  string
    sql: ${TABLE}.weather_date;;
    primary_key: yes
  }

  dimension: events {
    type: string
    sql: ${TABLE}.Events ;;
  }

  dimension: max_humidity {
    type: number
    sql: INTEGER(${TABLE}.Max_Humidity) ;;
  }

  dimension: max_temperature_f {
    type: string
    sql: ${TABLE}.Max_Temperature_F ;;
  }

  dimension: max_wind_speed_mph {
    type: string
    sql: ${TABLE}.Max_Wind_Speed_MPH ;;
  }

  dimension: mean_humidity {
    type: string
    sql: ${TABLE}.Mean_Humidity ;;
  }

  dimension: mean_temperature_f {
    type: number
    sql: cast(${TABLE}.Mean_TemperatureF as int64);;
  }

  dimension: mean_wind_speed_mph {
    type: number
    sql: ${TABLE}.Mean_Wind_Speed_MPH ;;
  }

  dimension: min_humidity {
    type: string
    sql: ${TABLE}.Min_Humidity ;;
  }

  dimension: min_temperature_f {
    type: string
    sql: ${TABLE}.Min_TemperatureF ;;
  }

  dimension: precipitation_in {
    type: string
    sql: ${TABLE}.Precipitation_In ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: predictions {
    type:  number
    sql:  (${mean_temperature_f} * 47.346939) + 3402.245766 ;;
  }
}
