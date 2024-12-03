view: api_results_alert_data {
  sql_table_name: "DWH"."API_RESULTS_ALERT_DATA" ;;

  dimension: api_provider {
    type: string
    sql: ${TABLE}."API_PROVIDER" ;;
  }

  dimension: Supplier {
    type: string
    sql: ${TABLE}."SUPPLIER" ;;
  }


  dimension: num_daily_results_dim {
    type: number
    sql: ${TABLE}."NUM_DAILY_RESULTS" ;;
  }
  dimension: num_results_prev_week_dim {
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
  dimension: wow_daily_results_change_dim {
    type: number
    sql: ${TABLE}."WOW_DAILY_RESULTS_CHANGE" ;;
  }

  measure: wow_daily_results_change {
    type: sum
    sql: ${TABLE}."wow_daily_results_change_dim" ;;
    value_format_name: "percent_0"

  }

  measure: num_daily_results {
    type: sum
    sql: ${TABLE}."num_daily_results_dim" ;;
  }

  measure: num_results_prev_week {
    type: sum
    sql: ${TABLE}."num_results_prev_week_dim" ;;
  }

  measure: count {
    type: count
  }
}
