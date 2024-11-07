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

#  measure: daily_searches_measure_2 {
#    type: sum
#    sql:   ${num_daily_searches};;
#  }

# Total WoW searches Change
  measure: wow_searches {
    type: number
    sql:
    (${daily_searches} -
    LAG(${daily_searches}, 1) OVER (ORDER BY ${search_week}))
     / NULLIF(LAG(${daily_searches}, 1) OVER (ORDER BY ${search_date_id}), 0) ;;
    value_format_name: "percent_2"
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
