view: wow_percentage_for_supplier_perf {
     derived_table: {
      sql:
      SELECT
        TO_CHAR(DATE_TRUNC('week', SEARCH_DATE), 'YYYY-MM-DD') AS search_week,
        SUPPLIER,
        SEARCHED_FOR AS search_destination,
        SUM(NUM_RESULTS) AS results,
        SUM(NUM_RESULTS) OVER (PARTITION BY SUPPLIER, SEARCHED_FOR, TO_CHAR(DATE_TRUNC('week', SEARCH_DATE), 'YYYY-MM-DD')) /
        SUM(NUM_RESULTS) OVER (PARTITION BY SEARCHED_FOR, TO_CHAR(DATE_TRUNC('week', SEARCH_DATE), 'YYYY-MM-DD')) AS supplier_results_destination_percentage
      FROM DWH.REPORT_SUPPLIER_PERFORMANCE
      GROUP BY 1, 2, 3
    ;;
    }

    dimension: search_week {
      type: date
      sql: ${TABLE}.search_week ;;
    }

    dimension: supplier {
      type: string
      sql: ${TABLE}.SUPPLIER ;;
    }

    dimension: search_destination {
      type: string
      sql: ${TABLE}.search_destination ;;
    }

#    measure: supplier_results_destination_percentage {
#      type: number
#      sql: ${TABLE}.supplier_results_destination_percentage ;;
#      value_format_name: "percent_2"
#    }


#measure: wow_supplier_results_destination_percentage {
#  type: number
#  sql:
#    (${supplier_results_destination_percentage} -
#    LAG(${supplier_results_destination_percentage}, 1)
#    OVER (PARTITION BY ${supplier}, ${search_destination} ORDER BY ${search_week}))
#    / NULLIF(LAG(${supplier_results_destination_percentage}, 1)
#    OVER (PARTITION BY ${supplier}, ${search_destination} ORDER BY ${search_week}), 0) ;;
#  value_format_name: "percent_0"
#  label: "WoW Change in Supplier Results Destination %"
#}

}
