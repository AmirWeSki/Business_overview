connection: "snowflake_dwh"

include: "/views/**/*.view.lkml"               # include all views in the views/ folder in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

datagroup: supply_side_business {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: supply_side_business

explore: report_groups_by_suppliers {
  label: "Supplier results"
}
