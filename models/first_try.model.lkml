connection: "snowflake_dwh"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: first_try_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: first_try_default_datagroup

explore: report_groups_by_suppliers {
  label: " Search results"


}
