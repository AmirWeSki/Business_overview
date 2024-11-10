view: bookings {
  sql_table_name: "DWH"."BOOKINGS" ;;
  drill_fields: [booking_id]

  dimension: booking_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."BOOKING_ID" ;;
  }
  dimension: ab_version {
    type: string
    sql: ${TABLE}."AB_VERSION" ;;
  }
  dimension: acc_api_provider {
    type: string
    sql: ${TABLE}."ACC_API_PROVIDER" ;;
  }
  dimension: acc_distance_from_center {
    type: number
    sql: ${TABLE}."ACC_DISTANCE_FROM_CENTER" ;;
  }
  dimension: acc_distance_from_ski {
    type: number
    sql: ${TABLE}."ACC_DISTANCE_FROM_SKI" ;;
  }
  dimension: acc_distance_from_skiset {
    type: number
    sql: ${TABLE}."ACC_DISTANCE_FROM_SKISET" ;;
  }
  dimension: acc_facilities {
    type: string
    sql: ${TABLE}."ACC_FACILITIES" ;;
  }
  dimension: acc_is_apartment {
    type: yesno
    sql: ${TABLE}."ACC_IS_APARTMENT" ;;
  }
  dimension: acc_popularity_score {
    type: number
    sql: ${TABLE}."ACC_POPULARITY_SCORE" ;;
  }
  dimension: acc_rating {
    type: number
    sql: ${TABLE}."ACC_RATING" ;;
  }
  dimension: acc_reviews_num {
    type: number
    sql: ${TABLE}."ACC_REVIEWS_NUM" ;;
  }
  dimension: acc_stars {
    type: number
    sql: ${TABLE}."ACC_STARS" ;;
  }
  dimension: acc_supplier {
    type: string
    sql: ${TABLE}."ACC_SUPPLIER" ;;
  }
  dimension: amount_dollar {
    type: number
    sql: ${TABLE}."AMOUNT_DOLLAR" ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }
  dimension: details {
    type: string
    sql: ${TABLE}."DETAILS" ;;
  }
  dimension: group_leader {
    type: number
    sql: ${TABLE}."GROUP_LEADER" ;;
  }
  dimension: hubspot_id {
    type: string
    sql: ${TABLE}."HUBSPOT_ID" ;;
  }
  dimension: is_admin {
    type: yesno
    sql: ${TABLE}."IS_ADMIN" ;;
  }
  dimension: origin {
    type: string
    sql: ${TABLE}."ORIGIN" ;;
  }
  dimension: package_ski_site_id {
    type: number
    sql: ${TABLE}."PACKAGE_SKI_SITE_ID" ;;
  }
  dimension: payment_visited {
    type: yesno
    sql: ${TABLE}."PAYMENT_VISITED" ;;
  }
  dimension: rentable_board_type {
    type: string
    sql: ${TABLE}."RENTABLE_BOARD_TYPE" ;;
  }
  dimension: rentable_quantity {
    type: number
    sql: ${TABLE}."RENTABLE_QUANTITY" ;;
  }
  dimension: rentable_size {
    type: number
    sql: ${TABLE}."RENTABLE_SIZE" ;;
  }
  dimension: rentable_type {
    type: string
    sql: ${TABLE}."RENTABLE_TYPE" ;;
  }
  dimension: search_children {
    type: number
    sql: ${TABLE}."SEARCH_CHILDREN" ;;
  }
  dimension: search_from_date {
    type: string
    sql: ${TABLE}."SEARCH_FROM_DATE" ;;
  }
  dimension: search_group_size {
    type: number
    sql: ${TABLE}."SEARCH_GROUP_SIZE" ;;
  }
  dimension: search_rooms {
    type: number
    sql: ${TABLE}."SEARCH_ROOMS" ;;
  }
  dimension: search_ski_site_id {
    type: number
    sql: ${TABLE}."SEARCH_SKI_SITE_ID" ;;
  }
  dimension: search_ski_site_name {
    type: string
    sql: ${TABLE}."SEARCH_SKI_SITE_NAME" ;;
  }
  dimension: status {
    type: number
    sql: ${TABLE}."STATUS" ;;
  }
  dimension_group: transaction {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."TRANSACTION_DATE" ;;
  }
  dimension: user_commission {
    type: number
    sql: ${TABLE}."USER_COMMISSION" ;;
  }
  measure: count {
    type: count
    drill_fields: [booking_id, search_ski_site_name]
  }
  measure: avg_acc_rating {
    type: average
    sql: ${TABLE}."ACC_RATING" ;;
  }
}
