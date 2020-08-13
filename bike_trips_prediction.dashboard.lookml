# - dashboard: bike_trips_prediction
#   title: Bike Trips Prediction
#   layout: newspaper
#   elements:
#   - name: Predictive Analysis
#     type: text
#     title_text: Predictive Analysis
#     subtitle_text: The graphs below will only display data if a predictive model has
#       been computed.
#     body_text: |-
#       ![image](https://api.dataplatform.ibm.com/v2/nav/graphics/wdp-logo-teal-lg.svg)
#       [Open Predictive Regression Model in IBM Watson Studio](https://dataplatform.ibm.com/analytics/notebooks/v2/304f3165-5b59-4ccd-9a52-c4fb2c8cda9d/view?projectid=ec629a34-1009-460a-b54e-86d5f2c3a94f&context=data)
#     row: 14
#     col: 0
#     width: 12
#     height: 4
#   - name: Seattle Bike Trips & Prediction
#     type: text
#     title_text: Seattle Bike Trips & Prediction
#     subtitle_text: Predicting bike trips for Seattle Cycle Share Program with weather
#       data
#     body_text: ''
#     row: 0
#     col: 0
#     width: 24
#     height: 2
#   - title: Trip Actuals and Predictions
#     name: Trip Actuals and Predictions
#     model: bike_trips
#     explore: trip
#     type: looker_scatter
#     fields:
#     - trip.start_date
#     - trip.trip_count
#     - trip.trip_count_prediction
#     - trip.trip_count_residual
#     - weather.temperature
#     - weather.humidity
#     filters:
#       trip.start_date: NOT NULL
#     sorts:
#     - trip.start_date desc
#     limit: 5000
#     column_limit: 50
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
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
#     show_null_points: true
#     point_style: circle
#     interpolation: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     query_timezone: America/Los_Angeles
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_ignored_fields: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     series_types: {}
#     hidden_fields:
#     - weather.temperature
#     - weather.humidity
#     - trip.trip_count_residual
#     y_axes:
#     - label: ''
#       maxValue:
#       minValue:
#       orientation: left
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count
#         name: Trip Count
#         axisId: trip.trip_count
#       - id: trip.trip_count_prediction
#         name: Trip Count Prediction
#         axisId: trip.trip_count_prediction
#     - label:
#       maxValue:
#       minValue:
#       orientation: right
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count_residual
#         name: Trip Count Residual
#         axisId: trip.trip_count_residual
#     series_colors:
#       trip.trip_count_prediction: "#ff0000"
#     row: 18
#     col: 0
#     width: 12
#     height: 8
#   - title: Trips by Date
#     name: Trips by Date
#     model: bike_trips
#     explore: trip
#     type: looker_scatter
#     fields:
#     - trip.start_date
#     - trip.trip_count
#     - trip.trip_count_prediction
#     - trip.trip_count_residual
#     - weather.temperature
#     - weather.humidity
#     filters:
#       trip.start_date: NOT NULL
#     sorts:
#     - trip.start_date desc
#     limit: 5000
#     column_limit: 50
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
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
#     show_null_points: true
#     point_style: circle
#     interpolation: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     query_timezone: America/Los_Angeles
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_ignored_fields: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     series_types: {}
#     hidden_fields:
#     - weather.humidity
#     - trip.trip_count_residual
#     - weather.temperature
#     - trip.trip_count_prediction
#     y_axes:
#     - label: ''
#       maxValue:
#       minValue:
#       orientation: left
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count
#         name: Trip Count
#         axisId: trip.trip_count
#       - id: trip.trip_count_prediction
#         name: Trip Count Prediction
#         axisId: trip.trip_count_prediction
#     - label:
#       maxValue:
#       minValue:
#       orientation: right
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count_residual
#         name: Trip Count Residual
#         axisId: trip.trip_count_residual
#     row: 2
#     col: 0
#     width: 8
#     height: 6
#   - title: Trips by Humidity
#     name: Trips by Humidity
#     model: bike_trips
#     explore: trip
#     type: looker_scatter
#     fields:
#     - trip.start_date
#     - trip.trip_count
#     - weather.humidity
#     filters:
#       trip.start_date: NOT NULL
#     sorts:
#     - trip.start_date desc
#     limit: 5000
#     column_limit: 50
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
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
#     show_null_points: true
#     point_style: circle
#     interpolation: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     query_timezone: America/Los_Angeles
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_ignored_fields: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     series_types: {}
#     hidden_fields:
#     - trip.start_date
#     y_axes:
#     - label: ''
#       maxValue:
#       minValue:
#       orientation: left
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count
#         name: Trip Count
#         axisId: trip.trip_count
#       - id: trip.trip_count_prediction
#         name: Trip Count Prediction
#         axisId: trip.trip_count_prediction
#     - label:
#       maxValue:
#       minValue:
#       orientation: right
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count_residual
#         name: Trip Count Residual
#         axisId: trip.trip_count_residual
#     row: 2
#     col: 16
#     width: 8
#     height: 6
#   - title: Trips by Temp
#     name: Trips by Temp
#     model: bike_trips
#     explore: trip
#     type: looker_scatter
#     fields:
#     - trip.start_date
#     - trip.trip_count
#     - weather.temperature
#     filters:
#       trip.start_date: NOT NULL
#     sorts:
#     - trip.start_date desc
#     limit: 5000
#     column_limit: 50
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
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
#     show_null_points: true
#     point_style: circle
#     interpolation: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     query_timezone: America/Los_Angeles
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_ignored_fields: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     series_types: {}
#     hidden_fields:
#     - trip.start_date
#     y_axes:
#     - label: ''
#       maxValue:
#       minValue:
#       orientation: left
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count
#         name: Trip Count
#         axisId: trip.trip_count
#       - id: trip.trip_count_prediction
#         name: Trip Count Prediction
#         axisId: trip.trip_count_prediction
#     - label:
#       maxValue:
#       minValue:
#       orientation: right
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count_residual
#         name: Trip Count Residual
#         axisId: trip.trip_count_residual
#     row: 2
#     col: 8
#     width: 8
#     height: 6
#   - title: Trips by Hour and Week or Weekend
#     name: Trips by Hour and Week or Weekend
#     model: bike_trips
#     explore: trip
#     type: looker_column
#     fields:
#     - trip.trip_count
#     - trip.trip_count_prediction
#     - trip.trip_count_residual
#     - trip.start_hour_of_day
#     - trip.week_or_weekend
#     pivots:
#     - trip.week_or_weekend
#     fill_fields:
#     - trip.start_hour_of_day
#     filters:
#       trip.start_date: NOT NULL
#     sorts:
#     - trip.start_hour_of_day
#     - trip.week_or_weekend
#     limit: 5000
#     column_limit: 50
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
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
#     show_null_points: true
#     point_style: circle
#     interpolation: linear
#     query_timezone: America/Los_Angeles
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_ignored_fields: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     series_types: {}
#     hidden_fields:
#     - trip.trip_count_residual
#     - trip.trip_count_prediction
#     y_axes:
#     - label: ''
#       maxValue:
#       minValue:
#       orientation: left
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count
#         name: Trip Count
#         axisId: trip.trip_count
#       - id: trip.trip_count_prediction
#         name: Trip Count Prediction
#         axisId: trip.trip_count_prediction
#     - label:
#       maxValue:
#       minValue:
#       orientation: right
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count_residual
#         name: Trip Count Residual
#         axisId: trip.trip_count_residual
#     x_axis_label: Trip Start Hour
#     row: 8
#     col: 8
#     width: 8
#     height: 6
#   - title: Trips by Age Group
#     name: Trips by Age Group
#     model: bike_trips
#     explore: trip
#     type: looker_column
#     fields:
#     - trip.trip_count
#     - trip.trip_count_prediction
#     - trip.trip_count_residual
#     - trip.week_or_weekend
#     - trip.age_group
#     pivots:
#     - trip.week_or_weekend
#     filters:
#       trip.start_date: NOT NULL
#       trip.age_group: "-Undefined"
#     sorts:
#     - trip.week_or_weekend 0
#     - trip.age_group
#     limit: 5000
#     column_limit: 50
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
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
#     show_null_points: true
#     point_style: circle
#     interpolation: linear
#     query_timezone: America/Los_Angeles
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_ignored_fields: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     series_types: {}
#     hidden_fields:
#     - trip.trip_count_residual
#     - trip.trip_count_prediction
#     y_axes:
#     - label: ''
#       maxValue:
#       minValue:
#       orientation: left
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count
#         name: Trip Count
#         axisId: trip.trip_count
#       - id: trip.trip_count_prediction
#         name: Trip Count Prediction
#         axisId: trip.trip_count_prediction
#     - label:
#       maxValue:
#       minValue:
#       orientation: right
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: false
#       valueFormat:
#       series:
#       - id: trip.trip_count_residual
#         name: Trip Count Residual
#         axisId: trip.trip_count_residual
#     x_axis_label: ''
#     row: 8
#     col: 0
#     width: 8
#     height: 6
#   - title: Trips and Predictions by Temp
#     name: Trips and Predictions by Temp
#     model: bike_trips
#     explore: trip
#     type: looker_scatter
#     fields:
#     - trip.start_date
#     - trip.trip_count
#     - trip.trip_count_prediction
#     - weather.temperature
#     filters:
#       trip.start_date: NOT NULL
#     sorts:
#     - trip.start_date
#     - seattle_seattle_weather.average_temperature
#     limit: 5000
#     column_limit: 50
#     query_timezone: America/Los_Angeles
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
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
#     show_null_points: true
#     point_style: circle
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_ignored_fields: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     series_types: {}
#     hidden_fields:
#     - trip.start_date
#     colors:
#     - 'palette: Default'
#     series_colors:
#       trip.trip_count_prediction: "#ff0000"
#     hidden_series: []
#     row: 18
#     col: 12
#     width: 12
#     height: 8
#   - title: Member and Non Member Rides by Week
#     name: Member and Non Member Rides by Week
#     model: bike_trips
#     explore: trip
#     type: looker_area
#     fields:
#     - trip.trip_count
#     - trip.is_a_member
#     - trip.start_week
#     pivots:
#     - trip.is_a_member
#     fill_fields:
#     - trip.is_a_member
#     - trip.start_week
#     filters:
#       trip.start_date: NOT NULL
#     sorts:
#     - trip.is_a_member
#     - trip.start_week desc
#     limit: 5000
#     column_limit: 50
#     stacking: percent
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
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
#     show_null_points: true
#     point_style: none
#     interpolation: linear
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     ordering: none
#     show_null_labels: false
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     query_timezone: America/Los_Angeles
#     conditional_formatting_ignored_fields: []
#     series_types: {}
#     hidden_fields:
#     colors:
#     - 'palette: Default'
#     series_colors: {}
#     hidden_series: []
#     column_spacing_ratio:
#     column_group_spacing_ratio:
#     focus_on_hover: false
#     swap_axes: false
#     series_labels:
#       No - trip.trip_count: Non-Member
#       Yes - trip.trip_count: Member
#     row: 8
#     col: 16
#     width: 8
#     height: 6
#   - title: Predictions vs Actuals
#     name: Predictions vs Actuals
#     model: bike_trips
#     explore: trip
#     type: table
#     fields:
#     - trip.trip_count
#     - trip.trip_count_prediction
#     - trip.trip_count_residual
#     - trip.start_date
#     fill_fields:
#     - trip.start_date
#     filters:
#       trip.start_date: NOT NULL
#     sorts:
#     - trip.start_date desc
#     limit: 500
#     dynamic_fields:
#     - table_calculation: from_actual
#       label: "% from actual"
#       expression: "(${trip.trip_count_prediction}-${trip.trip_count})/${trip.trip_count}"
#       value_format:
#       value_format_name: percent_2
#       _kind_hint: measure
#       _type_hint: number
#     query_timezone: America/Los_Angeles
#     show_view_names: true
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: unstyled
#     limit_displayed_rows: false
#     enable_conditional_formatting: true
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
#     show_null_points: true
#     point_style: none
#     interpolation: linear
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     conditional_formatting:
#     - type: greater than
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
#       - trip.trip_count_residual
#     row: 26
#     col: 0
#     width: 12
#     height: 7
#   - title: Predictions vs Residuals
#     name: Predictions vs Residuals
#     model: bike_trips
#     explore: trip
#     type: looker_scatter
#     fields:
#     - weather.weather_date
#     - trip.trip_count_prediction
#     - trip.trip_count_residual
#     fill_fields:
#     - weather.weather_date
#     filters:
#       trip.start_date: NOT NULL
#     sorts:
#     - weather.weather_date desc
#     limit: 5000
#     column_limit: 50
#     query_timezone: America/Los_Angeles
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: true
#     y_axis_gridlines: true
#     show_view_names: false
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: false
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     show_null_points: true
#     point_style: circle
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_ignored_fields: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     series_types: {}
#     hidden_fields: []
#     colors:
#     - 'palette: Default'
#     series_colors:
#       trip.trip_count_residual: "#ff0000"
#     hidden_series: []
#     y_axes:
#     - label: ''
#       maxValue:
#       minValue:
#       orientation: left
#       showLabels: true
#       showValues: true
#       tickDensity: default
#       tickDensityCustom: 5
#       type: linear
#       unpinAxis: true
#       valueFormat:
#       series:
#       - id: trip.trip_count_residual
#         name: Trip Count Residual
#         axisId: trip.trip_count_residual
#       - id: trip.trip_count_prediction
#         name: Trip Count Prediction
#         axisId: trip.trip_count_prediction
#     reference_lines:
#     - reference_type: line
#       line_value: '0'
#       range_start: max
#       range_end: min
#       margin_top: deviation
#       margin_value: mean
#       margin_bottom: deviation
#       label_position: right
#       color: "#0f1010"
#     row: 26
#     col: 12
#     width: 12
#     height: 7
