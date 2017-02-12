view: weather {
  derived_table: {
    sql:
      (
      SELECT
        weather.weather_date AS weather_weather,
        weather.Events  AS weather_events,
        cast(weather.Mean_TemperatureF as int64) AS weather_temperature,
        cast(weather.Mean_Humidity as int64) AS weather_humidity,
        cast(weather.Mean_Wind_Speed_MPH as int64) AS weather_wind_speed_mph
      FROM bike_trips.weather  AS weather
      )

      UNION ALL

      (SELECT
        -- weather.forecast_date AS weather_forecast_date
        DATE(timestamp(weather.forecast_date)) AS weather_weather_date,
      -- DATE(timestamp(forecast_date))
        weather.Status  AS weather_status,
        weather.Temperature  AS weather_temperature,
        weather.Humidity  AS weather_humidity,
        weather.Wind  AS weather_wind

      FROM bike_trips.weather_forecast  AS weather
      )
       ;;
  }

  dimension: weather_date {
    primary_key: yes
    type: string
    sql: ${TABLE}.weather_weather ;;
  }

  dimension: events {
    type: string
    sql: ${TABLE}.weather_events ;;
  }

  dimension: temperature {
    label: "Temperature (F)"
    type: number
    sql: ${TABLE}.weather_temperature ;;
  }

  dimension: humidity {
    type: number
    sql: ${TABLE}.weather_humidity ;;
  }

  dimension: wind_speed_mph {
    type: number
    sql: ${TABLE}.weather_wind_speed_mph ;;
  }

  set: detail {
    fields: [weather_date, events, temperature, humidity, wind_speed_mph]
  }
}
