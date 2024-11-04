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
  dimension: origin_airport {
    type: string
    sql: ${TABLE}."ORIGIN_AIRPORT" ;;
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

  measure: num_results_measure {
    type: sum
    sql:${num_results} ;;
  }

  measure: num_groups_measure {
    type: sum
    sql:${num_groups} ;;
  }

  measure: num_billed_groups_measure {
    type: sum
    sql:${num_billed_groups} ;;
  }

  measure: seach_to_bill {
    type: number
    sql:sum(${num_billed_groups_measure})/sum(${num_results_measure} ;;
  }

  measure: num_results_wow_change_percent {
    type: number
    sql: (${num_results_measure} - lag(${num_results_measure}, 1)) / nullif(lag(${num_results_measure}, 1), 0) ;;
    description: "Week-over-week percentage change in num results"
  }

  measure: formatted_num_results {
    type: string
    sql: concat(${num_results}, " WoW(", round(${num_results_wow_change_percent} * 100, 2), "%)") ;;
    description: "Formatted number of results with WoW change"
  }


}
