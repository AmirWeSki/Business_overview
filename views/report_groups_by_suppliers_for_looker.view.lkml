
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #

  view: report_groups_by_suppliers_for_looker {
    sql_table_name: dwh.report_groups_by_suppliers_for_looker;;

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


    dimension: Component {
      type: string
      sql: ${TABLE}."COMPONENT" ;;
    }

    dimension: Supplier {
      type: string
      sql: ${TABLE}."NAME" ;;
    }

    dimension: num_results_dim {
      type: number
      sql: ${TABLE}."NUM_RESULTS" ;;
    }

    measure: Results {
      type: sum
      sql:${num_results_dim} ;;
    }

    dimension: num_groups_dim {
      type: number
      sql: ${TABLE}."NUM_GROUPS" ;;
    }

    measure: Groups {
      type: sum
      sql:${num_groups_dim} ;;
    }

    dimension: num_billed_groups_dim {
      type: number
      sql: ${TABLE}."NUM_BILLED_GROUPS" ;;
    }

    measure: Billed_Groups {
      type: sum
      sql:${num_billed_groups_dim} ;;
    }

    dimension: GBV_USD_dim {
      type: number
      sql: ${TABLE}."GBV_USD" ;;
    }

    measure: GBV_USD {
      type: sum
      sql:${GBV_USD_dim} ;;
    }

    dimension: REVENUE_USD_dim {
      type: number
      sql: ${TABLE}."REVENUE_USD" ;;
    }

    measure: REVENUE_USD {
      type: sum
      sql:${REVENUE_USD_dim} ;;
    }

# WoW Change Measure by supplier name
    measure: wow_results_by_name {
      type: number
      sql:
          (${Results} -
          LAG(${Results}, 1) OVER (ORDER BY ${search_week}))
           / NULLIF(LAG(${Results}, 1) OVER (ORDER BY ${search_week}), 0) ;;
      value_format_name: "percent_0"
    }


}
#
