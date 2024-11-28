view: supplier_search_results_and_bookings {
  sql_table_name: "DWH"."SUPPLIER_SEARCH_RESULTS_AND_BOOKINGS" ;;

  dimension: api_provider {
    type: string
    sql: ${TABLE}."API_PROVIDER" ;;
  }
  dimension: component {
    type: string
    sql: ${TABLE}."COMPONENT" ;;
  }
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
  dimension: destination {
    type: string
    sql: ${TABLE}."DESTINATION" ;;
  }
  dimension: gbv_usd_dim {
    type: number
    sql: ${TABLE}."GBV_USD" ;;
  }

  dimension: net_usd_dim {
    type: number
    sql: ${TABLE}."NET_USD" ;;
  }

  dimension: num_groups {
    type: number
    sql: ${TABLE}."NUM_GROUPS" ;;
  }

  dimension: num_billed_groups {
    type: number
    sql: ${TABLE}."NUM_BILLED_GROUPS" ;;
  }
  dimension: num_results {
    type: number
    sql: ${TABLE}."NUM_RESULTS" ;;
  }
  dimension: resort_id {
    type: string
    sql: ${TABLE}."RESORT_ID" ;;
  }
  dimension: resort_name {
    type: string
    sql: ${TABLE}."RESORT_NAME" ;;
  }
  dimension: revenue_usd_dim {
    type: number
    sql: ${TABLE}."REVENUE_USD" ;;
  }
  dimension_group: search {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SEARCH_DATE" ;;
  }
  dimension: search_type {
    type: string
    sql: ${TABLE}."SEARCH_TYPE" ;;
  }
  dimension: supplier {
    type: string
    sql: ${TABLE}."SUPPLIER" ;;
  }
  measure: count {
    type: count
    drill_fields: [resort_name]
  }

  measure: Results {
    type: sum
    sql:${num_results} ;;
  }

  measure: Groups {
    type: sum
    sql:${num_groups} ;;
  }

  measure: Billed_groups {
    type: sum
    sql:${num_billed_groups} ;;
  }

  measure: GBV_USD {
    type: sum
    sql:${gbv_usd_dim} ;;
    value_format: "$#,##0" # Displays values in dollar format

  }

  measure: Net_USD {
    type: sum
    sql:${net_usd_dim} ;;
    value_format: "$#,##0" # Displays values in dollar format

  }


  measure: Revenue_USD {
    type: sum
    sql:${revenue_usd_dim} ;;
    value_format: "$#,##0" # Displays values in dollar format

  }

# WoW Change Measure by supplier and search destination
  measure: wow_results_by_supplier_search_destination {
    type: number
    sql:
          (${Results} -
          LAG(${Results}, 1) OVER (partition by ${supplier}, ${destination} ORDER BY ${search_week}))
           / NULLIF(LAG(${Results}, 1) OVER (partition by ${supplier}, ${destination} ORDER BY ${search_week}), 0) ;;
    value_format_name: "percent_0"
  }

# WoW Change Measure by supplier
  measure: wow_results_by_supplier {
    type: number
    sql:
          (${Results} -
          LAG(${Results}, 1) OVER (partition by ${supplier} ORDER BY ${search_week}))
           / NULLIF(LAG(${Results}, 1) OVER (partition by ${supplier} ORDER BY ${search_week}), 0) ;;
    value_format_name: "percent_0"
  }


# supplier_results_percentage out of destination
  measure: supplier_results_destination_percentage {
    type: number
    sql:
        sum(${Results}) OVER (partition by ${supplier}, ${destination} ORDER BY ${search_week})/
        sum(${Results}) OVER (partition by ${destination} ORDER BY ${search_week}) ;;
    value_format_name: "percent_2"
  }
}
