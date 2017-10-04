view: trip {
  derived_table: {
    sql: SELECT CAST(trip.trip_duration AS float64) as trip_duration_converted, * FROM bike_trips.trip as trip ;;
    persist_for: "365*24 hours"
  }


  dimension: trip_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.trip_id ;;
  }

#   dimension: compound_primary_id {
#     type: string
#     sql: CONCAT(${trip_id},  ;;
#   }

  dimension: bike_id {
    type: string
    sql: ${TABLE}.bike_id ;;
  }

  dimension: birthyear {
    type: string
    sql: ${TABLE}.birthyear ;;
  }

  dimension: age {
    type: number
    sql: EXTRACT(YEAR FROM CURRENT_DATE()) - SAFE_CAST(${birthyear} AS INT64) ;;
  }

  dimension: age_group {
    type: tier
    tiers: [18,25,35,45,55,65]
    style: integer
    sql: ${age} ;;
  }

  dimension: from_station_id {
    type: string
    sql: ${TABLE}.from_station_id ;;
  }

  dimension: from_station_name {
    type: string
    sql: ${TABLE}.from_station_name ;;
    drill_fields: [start_time]
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
      hour_of_day,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.start_time ;;
  }

  dimension: week_or_weekend {
    type: string
    sql: CASE WHEN EXTRACT(DAYOFWEEK FROM ${TABLE}.start_time) IN (1,2,3,4,5) THEN "Week" ELSE "Weekend" END ;;
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
    convert_tz: no
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
    sql: ${TABLE}.trip_duration_converted ;;
  }

  dimension: is_a_member {
    type: yesno
    sql: ${usertype} = "Member" ;;
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
    drill_fields: [ from_station_name, to_station_name, trip_count]
  }

  measure:  non_member_count {
    type: count
    filters: {
      field: usertype
      value: "-Member"
    }
  }

  measure: percent_non_member {
    type: number
    sql: ${non_member_count}/${trip_count} ;;
    value_format_name: percent_2
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

  measure: total_trip_duration_minutes {
    type: sum
    sql: ${trip_duration_minutes};;
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
    hidden: yes
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
    hidden: yes
    type: count_distinct
    sql:  ${start_date} ;;
  }

  measure:  average_trips_per_day {
    type:  number
    sql:  1.0 * ${trip_count}/NULLIF(${count_distinct_dates}, 0) ;;
    value_format_name: decimal_0
  }

  measure: trip_count_prediction{
    type: average
    sql:  (${trip_count_prediction.x0} * ${weather.temperature}) +
    (${trip_count_prediction.x1} * ${weather.humidity}) +
    ${trip_count_prediction.intercept};;
    value_format_name: decimal_1
    view_label: "Trip Count Prediction"
  }

  measure: trip_count_residual {
    type: number
    sql: ${trip_count} - ${trip_count_prediction} ;;
    view_label: "Trip Count Prediction"
    value_format_name: decimal_2
  }

  measure: trip_count_prediction_revenue{
    type: number
    sql:  ${trip_count_prediction} * 2.25;;
    value_format_name: decimal_1
    view_label: "Trip Count Prediction"
  }

  filter: weather_variance {
    type: string
    default_value: "5"
  }

  dimension: adjusted_weather {
    type: number
    sql: ${weather.temperature} + CAST({% parameter weather_variance %} AS FLOAT64) ;;

  }

  measure: trip_count_prediction_what_if {
    label: "Trip Count Prediction Upper Boundary"
    type: average
    sql:  (${trip_count_prediction.x0} * ${adjusted_weather}) +
         (${trip_count_prediction.x1} * ${weather.humidity}) +
         ${trip_count_prediction.intercept};;
    value_format_name: decimal_1
    view_label: "Trip Count Prediction"
  }


  measure: trip_count_prediction_what_if_lower {
    label: "Trip Count Prediction Lower Boundary"
    type: number
    sql: 2 * ${trip_count_prediction} - ${trip_count_prediction_what_if} ;;
    value_format_name: decimal_1
    view_label: "Trip Count Prediction"
  }

  measure: average_trip_cost {
    type: average
    sql: ${bike_rental_added_cost} ;;
  }

  ###### MEMBER SPECIFIC COUNTS #######

  measure: average_trip_cost_for_members {
    type: average
    sql: ${bike_rental_added_cost} ;;
    filters: {
      field: is_a_member
      value: "yes"
      }
    value_format_name: "usd"
    }

  measure: average_trip_cost_for_nonmembers {
    type: average
    sql: ${bike_rental_added_cost} ;;
    filters: {
      field: is_a_member
      value: "no"
    }
    value_format_name: "usd"

  }

  set: detail {
    fields: [
      trip_count_prediction_what_if
      , adjusted_weather
#       , weather_variance
      , trip_count_prediction_revenue
      , trip_count_residual
      , trip_count_prediction
      ]
  }
}
