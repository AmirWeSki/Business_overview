connection: "snowflake_dwh"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: first_try_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: first_try_default_datagroup

explore: report_groups_by_suppliers {
  label: "Search results"
  join: num_searches_daily {  # joining to be able to compare to totals WoW
    type: left_outer
    sql_on: ${report_groups_by_suppliers.search_date} = ${num_searches_daily.search_date_id} ;;
    relationship: many_to_one
  }

join: searches_by_resort { # joining to be able to compare to WoW per resort
  type: left_outer
  sql_on: ${report_groups_by_suppliers.search_date} = ${searches_by_resort.search_date_id} ;;
  relationship: many_to_one  # Adjust the relationship as necessary
}

}
