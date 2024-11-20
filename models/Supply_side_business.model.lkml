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



explore: report_supplier_performance {
  view_name: report_supplier_performance
  label: "Suppliers Performance and Search Results"
#join: searches_by_resort { # joining to be able to compare to WoW per resort
 # type: left_outer
#  sql_on: ${report_supplier_performance.search_date} = ${searches_by_resort.search_date_id} and ${report_supplier_performance.SEARCHED_FOR} = ${searches_by_resort.SEARCHED_FOR};;
 # relationship: many_to_one # Adjust the relationship as necessary

#}
}

#explore: report_supplier_performance {
#explore: report_supplier_performance {
#  from: report_supplier_performance # The main view remains the same
#
#  join: wow_percentage_for_supplier_perf { # Joining wow_percentage_for_supplier_perf within the same Explore
#    sql_on: ${report_supplier_performance.Supplier} = ${wow_percentage_for_supplier_perf.supplier}
#             AND ${report_supplier_performance.Search_destination} = ${wow_percentage_for_supplier_perf.search_destination}
#             AND ${report_supplier_performance.search_week} = ${wow_percentage_for_supplier_perf.search_week} ;;
#    relationship: many_to_one
#    type: left_outer
#  }
#}


#explore: report_supplier_performance {
#explore: report_supplier_performance {
#  from: report_supplier_performance # The main view remains the same
#
#  join: wow_percentage_for_supplier_perf { # Joining wow_percentage_for_supplier_perf within the same Explore
#    sql_on: ${report_supplier_performance.Supplier} = ${wow_percentage_for_supplier_perf.supplier}
#             AND ${report_supplier_performance.Search_destination} = ${wow_percentage_for_supplier_perf.search_destination}
#             AND ${report_supplier_performance.search_week} = ${wow_percentage_for_supplier_perf.search_week} ;;
#    relationship: many_to_one
#    type: left_outer
#  }
#}
