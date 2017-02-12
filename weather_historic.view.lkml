view: weather_historic {
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
    sql: timestamp(${TABLE}.weather_date);;
    convert_tz: no
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

  dimension: humidity {
    label: "Humidity"
    type: string
    sql: cast(${TABLE}.Mean_Humidity as int64);;
  }

  dimension: temperature {
    label: "Temperature (F)"
    type: number
    sql: cast(${TABLE}.Mean_TemperatureF as int64);;
  }

  dimension: wind_speed_mph {
    type: number
    sql: cast(${TABLE}.Mean_Wind_Speed_MPH as int64);;
  }

  dimension: precipitation_in {
    type: string
    sql: cast(${TABLE}.Precipitation_In as int64);;
  }



  dimension: max_humidity {
    type: number
    hidden: yes
    sql: INTEGER(${TABLE}.Max_Humidity) ;;
  }

  dimension: max_temperature_f {
    type: string
    hidden: yes
    sql: ${TABLE}.Max_Temperature_F ;;
  }

  dimension: max_wind_speed_mph {
    hidden: yes
    type: string
    sql: ${TABLE}.Max_Wind_Speed_MPH ;;
  }

  dimension: min_humidity {
    hidden: yes
    type: string
    sql: ${TABLE}.Min_Humidity ;;
  }

  dimension: min_temperature_f {
    hidden: yes
    type: string
    sql: ${TABLE}.Min_TemperatureF ;;
  }

}
