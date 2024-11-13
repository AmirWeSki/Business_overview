view: report_supplier_performance {
  sql_table_name: "DWH"."REPORT_SUPPLIER_PERFORMANCE" ;;

  dimension: Component {
    type: string
    sql: ${TABLE}."COMPONENT" ;;
  }
  dimension_group: from_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_FROM" ;;
  }
  dimension_group: to_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_TO" ;;
  }

  dimension: Resort_id {
    type: string
    sql: ${TABLE}."RESORT_ID" ;;
  }



  dimension: Resort {
    type: string
    sql: ${TABLE}."RESORT_NAME" ;;
  }

  dimension: Search_destination {
    type: string
    sql: ${TABLE}."SEARCHED_FOR" ;;
  }


  dimension: Search_type {
    type: string
    sql: ${TABLE}."Search_type" ;;
  }
  dimension: GBV_USD_dim {
    type: number
    sql: ${TABLE}."GBV_USD" ;;
  }
  dimension: num_billed_groups_dim {
    type: number
    sql: ${TABLE}."NUM_BILLED_GROUPS" ;;
  }

  measure: Billed_Groups {
    type: sum
    sql:${num_billed_groups_dim} ;;
  }


  dimension: num_groups_dim {
    type: number
    sql: ${TABLE}."NUM_GROUPS" ;;
  }

  measure: Groups {
    type: sum
    sql:${num_groups_dim} ;;
  }

  dimension: num_results_dim {
    type: number
    sql: ${TABLE}."NUM_RESULTS" ;;
  }

  measure: Results {
    type: sum
    sql:${num_results_dim} ;;
  }




  dimension: REVENUE_USD_dim {
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

  dimension: Supplier {
    type: string
    sql: ${TABLE}."SUPPLIER" ;;
  }

  measure: GBV_USD {
    type: sum
    sql:${GBV_USD_dim} ;;
  }

  measure: REVENUE_USD {
    type: sum
    sql:${REVENUE_USD_dim} ;;
  }

# WoW Change Measure by supplier and search destination
  measure: wow_results_by_supplier_search_destination {
    type: number
    sql:
          (${Results} -
          LAG(${Results}, 1) OVER (partition by ${Supplier}, ${Search_destination} ORDER BY ${search_week}))
           / NULLIF(LAG(${Results}, 1) OVER (partition by ${Supplier}, ${Search_destination} ORDER BY ${search_week}), 0) ;;
    value_format_name: "percent_0"
  }


  measure: count {
    type: count
  }
}
