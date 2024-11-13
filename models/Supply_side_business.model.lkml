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


explore: report_suppliers_search_results {
  view_name: report_suppliers_search_results
  label: "Suppliers Search Results_old"
}

explore: report_supplier_performance {
  view_name: report_supplier_performance
  label: "Suppliers Performance and Search Results"
}
