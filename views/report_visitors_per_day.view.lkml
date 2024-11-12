view: report_visitors_per_day {
  sql_table_name: "DWH"."REPORT_VISITORS_PER_DAY" ;;

  dimension_group: search {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SEARCH_DATE" ;;
  }
  dimension: searches_dim {
    type: number
    sql: ${TABLE}."SEARCHES" ;;
  }

  measure: searches {
    type: sum
    sql:${searches_dim} ;;
  }

  dimension: visitors_dim {
    type: number
    sql: ${TABLE}."VISITORS" ;;
  }

  measure: visitors {
    type: sum
    sql:${visitors_dim} ;;
  }

  dimension: visitors_searched_dim {
    type: number
    sql: ${TABLE}."VISITORS_SEARCHED" ;;
  }

  measure: visitors_searched {
    type: sum
    sql:${visitors_searched_dim} ;;
  }

# wow_visitors_searched
  measure: wow_visitors_searched {
    type: number
    sql:
    (${visitors_searched} -
    LAG(${visitors_searched}, 1) OVER (ORDER BY ${search_week}))
     / NULLIF(LAG(${visitors_searched}, 1) OVER (ORDER BY ${search_week}), 0) ;;
    value_format_name: "percent_0"
  }


}
