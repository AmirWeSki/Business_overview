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
  join:  : num_searches_per_week {
    type: left_outer
    sql_on: ${report_groups_by_suppliers.search_date} = ${num_searches_per_week.search_week_week}} ;;
    relationship: many_to_one
  }


}
