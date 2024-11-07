view: num_searches_daily {
  sql_table_name: "DWH"."NUM_SEARCHES_DAILY" ;;

#  dimension: num_daily_searches_dim {
#    type: number
#    sql: ${TABLE}."NUM_DAILY_SEARCHES" ;;
#}

  dimension: search_date_id {
    type: date
    sql: ${TABLE}."SEARCH_DATE" ;;
    primary_key: yes
  }

  dimension: num_daily_searches_dim {
    type: number
    sql:  ${TABLE}."NUM_DAILY_SEARCHES" ;;
  }

  measure: daily_searches {
    type: sum
    sql:   ${num_daily_searches_dim};;
  }

  dimension: weekly_searches_dim {
    type: number
    sql:  ${TABLE}."WEEKLY_SEARCHES" ;;
  }

  measure: weekly_searches {
    type: average
    sql:   ${weekly_searches_dim};;
  }


  dimension: Total_weekly_SEARCHES_WOW_dim {
    type: number
    sql:  ${TABLE}."WEEKLY_SEARCHES_WOW_CHANGE" ;;
  }

  measure: total_weekly_searches_wow {
    type: average
    sql:   ${Total_weekly_SEARCHES_WOW_dim};;
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
