
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #

  view: snowflake_view {
    sql_table_name: "dwh.report_groups_by_suppliers_view";;


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
      sql: ${TABLE}."NAME" ;;
    }

    dimension: num_results_dim {
      type: number
      sql: ${TABLE}."NUM_RESULTS" ;;
    }

    measure: results {
      type: sum
      sql:${num_results_dim} ;;
    }

}
