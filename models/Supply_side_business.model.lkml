connection: "snowflake_dwh"

#include: "/views/**/*.view.lkml"               # include all views in the views/ folder in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

include: "/views/**/*.view.lkml"
#include: "/views/supplier_reports/**/*.view.lkml"

datagroup: supply_side_business {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

explore: report_groups_by_suppliers_for_looker {
  label: "Supplier performance"
}
