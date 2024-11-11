view: searches_by_resort {
  sql_table_name: "DWH"."SEARCHES_BY_RESORT" ;;

  dimension: search_date_id {
    type: date
    sql: ${TABLE}."SEARCH_DATE" ;;
    primary_key: yes
  }

  dimension: num_daily_searches {
    type: number
    sql: ${TABLE}."NUM_DAILY_SEARCHES" ;;
  }
  dimension: prev_week_searches_by_resort {
    type: number
    sql: ${TABLE}."PREV_WEEK_SEARCHES_BY_RESORT" ;;
  }
  dimension: resort {
    type: string
    sql: ${TABLE}."RESORT" ;;
  }
  dimension_group: search {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SEARCH_DATE" ;;
  }
  dimension: search_type {
    type: string
    sql: ${TABLE}."SEARCH_TYPE" ;;
  }
  dimension_group: week_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."WEEK_START_DATE" ;;
  }
  dimension: weekly_searches {
    type: number
    sql: ${TABLE}."WEEKLY_SEARCHES" ;;
  }
  dimension: weekly_searches_wow_change_by_resort {
    type: number
    sql: ${TABLE}."WEEKLY_SEARCHES_WOW_CHANGE_BY_RESORT" ;;
  }
  measure: count {
    type: count
  }
}
