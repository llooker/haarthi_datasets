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
    hidden: yes
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    hidden: yes
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: station_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;

    action: {
      label: "Re-route Bikes"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "From"
        required: yes
        default: "{{ station_id._value }}"
      }
      form_param: {
        name: "To"
        required: yes
      }
      form_param: {
        name: "Amount"
        required: yes
      }
    }
  }

  dimension: modification_date {
    type: string
    sql: ${TABLE}.modification_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;

    action: {
      label: "Re-route Bikes"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://cdn.geekwire.com/wp-content/uploads/2014/05/bikeshare.jpeg"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "From"
        required: yes
        default: "{{ name._value }}"
      }
      form_param: {
        name: "To"
        required: yes
      }
      form_param: {
        name: "Amount"
        required: yes
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [station_id, name]
  }
}
