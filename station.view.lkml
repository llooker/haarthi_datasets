view: station {
  sql_table_name: bike_trips.station ;;

  dimension: station_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.station_id ;;
  }

  dimension: current_dock_count {
    type: string
    sql: ${TABLE}.current_dock_count ;;
  }

  dimension: decommision_date {
    type: string
    sql: ${TABLE}.decommision_date ;;
  }

  dimension: install_date {
    type: string
    sql: ${TABLE}.install_date ;;
  }

  dimension: install_dock_count {
    type: string
    sql: ${TABLE}.install_dock_count ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: modification_date {
    type: string
    sql: ${TABLE}.modification_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [station_id, name]
  }
}
