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

  dimension: trip_duration_minutes {
    type: number
    sql: ${trip_duration}/60.0;;
  }

  dimension: usertype {
    type: string
    sql: ${TABLE}.usertype ;;
  }

  measure: trip_count {
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

  dimension:  bike_rental_added_cost {
    type: number
    sql:
     CASE WHEN ${trip_duration_minutes} < 30 then 0
          WHEN ${trip_duration_minutes} >=30 then ((${trip_duration_minutes}-30)/15) * 2.5
          ELSE NULL
     END;;
    value_format_name: usd_0
  }

  measure:  average_bike_rental_added_cost {
    type:  average
    sql: ${bike_rental_added_cost} ;;
    value_format_name: usd_0
  }

  measure:  total_bike_rental_added_cost {
    type:  sum
    sql: ${bike_rental_added_cost} ;;
    value_format_name: usd_0
  }


  measure:  count_distinct_dates {
    type: count_distinct
    sql:  ${start_date} ;;
  }

  measure:  average_trips_per_day {
    type:  number
    sql:  1.0 * ${trip_count}/${count_distinct_dates} ;;
    value_format_name: decimal_0
  }
}
