view: from_to_trip {
  derived_table: {
    sql: SELECT
  IF(start_station.latitude  IS NOT NULL AND start_station.longitude  IS NOT NULL, CONCAT(IFNULL(CAST(start_station.latitude  AS STRING), ''),',',IFNULL(CAST(start_station.longitude  AS STRING), '')), NULL) AS start_station_station_location,
  trip.from_station_name  AS trip_from_station_name,
  trip.to_station_name  AS trip_to_station_name,
  trip.from_station_id  AS trip_from_station_id,
  trip.to_station_id  AS trip_to_station_id,
  cast(trip.trip_duration as FLOAT64) AS trip_trip_duration,
  trip.trip_id  AS trip_trip_id,
  COUNT(*) AS trip_trip_count
FROM bike_trips.trip  AS trip
LEFT JOIN bike_trips.station  AS start_station ON trip.from_station_id = start_station.station_id

WHERE
  start_station.latitude  IS NOT NULL AND start_station.longitude  IS NOT NULL
GROUP BY 1,2,3,4,5,6,7
ORDER BY 8 DESC ;;
  }

  dimension: trip_trip_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.trip_trip_id ;;
  }

  dimension: start_station_station_location {
    type: location
    sql: ${TABLE}.start_station_station_location ;;
  }

  dimension: trip_from_station_id  {
    type: string
    sql: ${TABLE}.trip_from_station_id;;
  }

  dimension: trip_to_station_id {
    type: string
    sql: ${TABLE}.trip_to_station_id ;;
  }

}
