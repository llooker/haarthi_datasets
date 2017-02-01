view: trip {
  sql_table_name: bike_trips.trip ;;

  dimension: trip_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.trip_id ;;
  }

  dimension: bike_id {
    type: string
    sql: ${TABLE}.bike_id ;;
  }

  dimension: birthyear {
    type: string
    sql: ${TABLE}.birthyear ;;
  }

  dimension: from_station_id {
    type: string
    sql: ${TABLE}.from_station_id ;;
  }

  dimension: from_station_name {
    type: string
    sql: ${TABLE}.from_station_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_time ;;
  }

  dimension_group: stop {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.stop_time ;;
  }

  dimension: to_station_id {
    type: string
    sql: ${TABLE}.to_station_id ;;
  }

  dimension: to_station_name {
    type: string
    sql: ${TABLE}.to_station_name ;;
  }

  dimension: trip_duration {
    type: number
    sql: cast(${TABLE}.trip_duration as FLOAT64);;
  }

  dimension: usertype {
    type: string
    sql: ${TABLE}.usertype ;;
  }

  measure: count {
    type: count
    drill_fields: [trip_id, from_station_name, to_station_name, trip.count]
  }

  measure:  average_trip_duration_seconds {
    type: average
    sql: ${trip_duration} ;;
    value_format_name: decimal_2
  }

  measure:  average_trip_duration_minutes {
    type: average
    sql: ${trip_duration} / 60.0;;
    value_format_name: decimal_2
  }

  measure:  count_distinct_dates {
    type: count_distinct
    sql:  ${start_date} ;;
  }
}
