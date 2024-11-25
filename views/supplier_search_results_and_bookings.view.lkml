view: supplier_search_results_and_bookings {
  sql_table_name: "DWH"."SUPPLIER_SEARCH_RESULTS_AND_BOOKINGS" ;;

  dimension: api_provider {
    type: string
    sql: ${TABLE}."API_PROVIDER" ;;
  }
  dimension: component {
    type: string
    sql: ${TABLE}."COMPONENT" ;;
  }
  dimension_group: date_from {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_FROM" ;;
  }
  dimension_group: date_to {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_TO" ;;
  }
  dimension: destination {
    type: string
    sql: ${TABLE}."DESTINATION" ;;
  }
  dimension: gbv_usd {
    type: number
    sql: ${TABLE}."GBV_USD" ;;
  }
  dimension: num_groups {
    type: number
    sql: ${TABLE}."NUM_GROUPS" ;;
  }
  dimension: num_results {
    type: number
    sql: ${TABLE}."NUM_RESULTS" ;;
  }
  dimension: resort_id {
    type: string
    sql: ${TABLE}."RESORT_ID" ;;
  }
  dimension: resort_name {
    type: string
    sql: ${TABLE}."RESORT_NAME" ;;
  }
  dimension: revenue_usd {
    type: number
    sql: ${TABLE}."REVENUE_USD" ;;
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
  dimension: supplier {
    type: string
    sql: ${TABLE}."SUPPLIER" ;;
  }
  measure: count {
    type: count
    drill_fields: [resort_name]
  }
}
