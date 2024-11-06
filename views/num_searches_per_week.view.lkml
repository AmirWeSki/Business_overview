view: num_searches_per_week {
  sql_table_name: "DWH"."NUM_SEARCHES_PER_WEEK" ;;

  dimension: num_weekly_searches {
    type: number
    sql: ${TABLE}."NUM_WEEKLY_SEARCHES" ;;
  }
  dimension_group: search_week {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SEARCH_WEEK" ;;
  }
  measure: count {
    type: count
  }
}
