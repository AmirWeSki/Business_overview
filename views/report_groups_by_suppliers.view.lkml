view: report_groups_by_suppliers {
  sql_table_name: "DWH"."REPORT_GROUPS_BY_SUPPLIERS" ;;

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
  dimension: destination_site_id {
    type: number
    sql: ${TABLE}."DESTINATION_SITE_ID" ;;
  }
  dimension: dimension {
    type: string
    sql: ${TABLE}."DIMENSION" ;;
  }
  dimension: gbv_usd {
    type: number
    sql: ${TABLE}."GBV_USD" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }
  dimension: num_billed_groups {
    type: number
    sql: ${TABLE}."NUM_BILLED_GROUPS" ;;
  }
  dimension: num_groups {
    type: number
    sql: ${TABLE}."NUM_GROUPS" ;;
  }
  dimension: num_results {
    type: number
    sql: ${TABLE}."NUM_RESULTS" ;;
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
  dimension: ski_site {
    type: string
    sql: ${TABLE}."SKI_SITE" ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
