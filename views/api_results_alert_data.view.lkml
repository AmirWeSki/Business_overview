view: api_results_alert_data {
  sql_table_name: "DWH"."API_RESULTS_ALERT_DATA" ;;

  dimension: api_provider {
    type: string
    sql: ${TABLE}."API_PROVIDER" ;;
  }
  dimension: num_daily_results {
    type: number
    sql: ${TABLE}."NUM_DAILY_RESULTS" ;;
  }
  dimension: num_results_prev_week {
    type: number
    sql: ${TABLE}."NUM_RESULTS_PREV_WEEK" ;;
  }
  dimension_group: search {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SEARCH_DATE" ;;
  }
  dimension: wow_daily_results_change {
    type: number
    sql: ${TABLE}."WOW_DAILY_RESULTS_CHANGE" ;;
  }
  measure: count {
    type: count
  }
}
