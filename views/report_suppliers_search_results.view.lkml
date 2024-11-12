view: report_suppliers_search_results {
  sql_table_name: "DWH"."REPORT_SUPPLIERS_SEARCH_RESULTS" ;;

  dimension: Component {
    type: string
    sql: ${TABLE}."COMPONENT" ;;
  }
  dimension_group: check_in_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_FROM" ;;
  }
  dimension_group: check_out_date {
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
  dimension: search_destination_type {
    type: string
    sql: ${TABLE}."DESTINATION_TYPE" ;;
  }
  dimension: num_results_dim {
    type: number
    sql: ${TABLE}."NUM_RESULTS" ;;
  }

  measure: Results {
    type: sum
    sql:${num_results_dim} ;;
  }

# WoW results by supplier and resort
  measure: wow_results_by_supplier_resort {
    type: number
    sql:
          (${Results} -
          LAG(${Results}, 1) OVER (partition by ${Supplier}, ${Resort} ORDER BY ${search_week}))
           / NULLIF(LAG(${Results}, 1) OVER (partition by ${Supplier}, ${Resort} ORDER BY ${search_week}), 0) ;;
    value_format_name: "percent_0"
  }


  dimension_group: search {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SEARCH_DATE" ;;
  }
  dimension: Resort {
    type: string
    sql: ${TABLE}."SKI_SITE" ;;
  }
  dimension: Supplier {
    type: string
    sql: ${TABLE}."SUPPLIER" ;;
  }



}
