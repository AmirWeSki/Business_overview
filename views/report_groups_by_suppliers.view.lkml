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


# WoW Change Measure
  measure: wow_results {
    type: number
    sql:
    (SUM(${num_results_measure}) -
    LAG(SUM(${num_results_measure}), 1) OVER (PARTITION BY ${name} ORDER BY ${search_week}))
    ) / NULLIF(LAG(SUM(${num_results_measure}), 1) OVER (PARTITION BY ${name} ORDER BY ${search_week}), 0) ;;
    value_format_name: "percent_2"
  }

}
