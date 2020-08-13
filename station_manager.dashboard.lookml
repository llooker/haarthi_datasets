# - dashboard: station_manager
#   title: Station Manager
#   layout: newspaper
#   elements:
#   - title: Bike Trips Predictions by Station
#     name: Bike Trips Predictions by Station
#     model: bike_trips
#     explore: weather
#     type: table
#     fields:
#     - station.name
#     - station_prediction.start_predictions
#     - station_prediction.end_predictions
#     - station_prediction.predicted_station_overflow
#     filters:
#       station.name: "-NULL"
#     sorts:
#     - station_prediction.predicted_station_overflow
#     limit: 500
#     column_limit: 50
#     show_view_names: false
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     limit_displayed_rows: false
#     enable_conditional_formatting: true
#     conditional_formatting_ignored_fields: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     conditional_formatting:
#     - type: low to high
#       value:
#       background_color:
#       font_color:
#       palette:
#         name: Red to Yellow to Green
#         colors:
#         - "#F36254"
#         - "#FCF758"
#         - "#4FBC89"
#       bold: false
#       italic: false
#       strikethrough: false
#       fields:
#       - station_prediction.predicted_station_overflow
#     series_labels:
#       station.name: Station Name
#     listen:
#       Date: weather.weather_date
#     title_hidden: true
#     row: 4
#     col: 15
#     width: 9
#     height: 15
#   - title: Bike Trips by Station Map - Predictive Overflow
#     name: Bike Trips by Station Map - Predictive Overflow
#     model: bike_trips
#     explore: weather
#     type: looker_map
#     fields:
#     - station.name
#     - station.station_location
#     - station_prediction.start_predictions
#     - station_prediction.end_predictions
#     - station_prediction.predicted_station_overflow
#     filters: {}
#     sorts:
#     - over_utilization desc
#     limit: 500
#     dynamic_fields:
#     - table_calculation: over_utilization
#       label: Over Utilization
#       expression: "${station_prediction.predicted_station_overflow}*-1"
#       value_format:
#       value_format_name: decimal_2
#       _kind_hint: measure
#       _type_hint: number
#     query_timezone: America/Los_Angeles
#     map_plot_mode: points
#     heatmap_gridlines: false
#     heatmap_gridlines_empty: false
#     heatmap_opacity: 0.5
#     show_region_field: true
#     draw_map_labels_above_data: true
#     map_tile_provider: positron
#     map_position: custom
#     map_scale_indicator: 'off'
#     map_pannable: true
#     map_zoomable: true
#     map_marker_type: circle
#     map_marker_icon_name: default
#     map_marker_radius_mode: proportional_value
#     map_marker_units: meters
#     map_marker_proportional_scale_type: linear
#     map_marker_color_mode: value
#     show_view_names: true
#     show_legend: true
#     quantize_map_value_colors: false
#     reverse_map_value_colors: false
#     hidden_fields:
#     - station_prediction.start_predictions
#     - station_prediction.end_predictions
#     map_latitude: 47.6324125246634
#     map_longitude: -122.32014656066896
#     map_zoom: 13
#     map_marker_radius_max: 300
#     map_value_colors:
#     - red
#     - yellow
#     - green
#     map_marker_radius_min: 50
#     listen:
#       Date: weather.weather_date
#     title_hidden: true
#     row: 4
#     col: 0
#     width: 15
#     height: 15
#   - title: Trip Count Prediction
#     name: Trip Count Prediction
#     model: bike_trips
#     explore: trip
#     type: single_value
#     fields:
#     - trip.trip_count_prediction
#     filters: {}
#     limit: 500
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     hidden_fields: []
#     single_value_title: Predicted Trip Count
#     listen:
#       Date: weather.weather_date
#     row: 0
#     col: 3
#     width: 5
#     height: 4
#   - title: Average Trip Cost
#     name: Average Trip Cost
#     model: bike_trips
#     explore: trip
#     type: single_value
#     fields:
#     - trip.average_trip_cost_for_nonmembers
#     - trip.average_trip_cost_for_members
#     limit: 500
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     show_view_names: true
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     hidden_fields: []
#     single_value_title: Avg. Trip Cost
#     comparison_label: Member Cost
#     row: 0
#     col: 20
#     width: 4
#     height: 4
#   - title: Daily Weather Forecast
#     name: Daily Weather Forecast
#     model: bike_trips
#     explore: trip
#     type: single_value
#     fields:
#     - weather.temperature
#     - weather.humidity
#     - weather.events
#     filters: {}
#     sorts:
#     - weather.temperature desc
#     limit: 500
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     show_view_names: true
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     hidden_fields:
#     - weather.humidity
#     single_value_title: Temp (F)
#     comparison_label: Forecast
#     listen:
#       Date: weather.weather_date
#     row: 0
#     col: 0
#     width: 3
#     height: 4
#   - title: Expected Revenue
#     name: Expected Revenue
#     model: bike_trips
#     explore: trip
#     type: single_value
#     fields:
#     - trip.trip_count_prediction_revenue
#     filters: {}
#     limit: 500
#     dynamic_fields:
#     - table_calculation: goal
#       label: Goal
#       expression: '850'
#       value_format:
#       value_format_name: usd_0
#       _kind_hint: dimension
#       _type_hint: number
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: progress_percentage
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     show_view_names: true
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     hidden_fields: []
#     listen:
#       Date: weather.weather_date
#     row: 0
#     col: 8
#     width: 4
#     height: 4
#   filters:
#   - name: Date
#     title: Date
#     type: date_filter
#     default_value: today
#     allow_multiple_values: true
#     required: false
