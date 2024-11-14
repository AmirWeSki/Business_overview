connection: "snowflake_dwh"

#include: "/views/**/*.view.lkml"               # include all views in the views/ folder in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

include: "/views/**/*.view.lkml"
#include: "/views/supplier_reports/**/*.view.lkml"

datagroup: supply_side_business {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}


explore: SEARCHES_BY_RESORT_for_looker {
  view_name: searches_by_resort_for_looker
  label: "Searches by resort"
}



#explore: report_supplier_performance {
#  view_name: report_supplier_performance
#  label: "Suppliers Performance and Search Results"
#}

#explore: report_supplier_performance {
#  join: WoW_percentage_for_supplier_perf {
#    sql_on: ${report_supplier_performance.supplier} = ${WoW_percentage_for_supplier_perf.supplier}
#             AND ${report_supplier_performance.search_destination} = ${WoW_percentage_for_supplier_perf.search_destination}
#             AND ${report_supplier_performance.search_week} = ${WoW_percentage_for_supplier_perf.search_week} ;;
#    relationship: many_to_one
#    type: left_outer
#
#  }
#}
