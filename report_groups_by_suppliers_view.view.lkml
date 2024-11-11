
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

}
