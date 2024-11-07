view: num_searches_daily {
  sql_table_name: "DWH"."NUM_SEARCHES_DAILY" ;;

  measure: num_daily_searches {
    type: sum
    sql: ${num_daily_searches} ;;
  }
  dimension_group: search {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SEARCH_DATE" ;;
  }
  measure: count {
    type: count
  }


}
