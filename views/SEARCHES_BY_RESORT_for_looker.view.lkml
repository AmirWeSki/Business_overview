
  view: searches_by_resort_for_looker {
    sql_table_name: dwh.SEARCHES_BY_RESORT_for_looker ;; # Points to the Snowflake view


      dimension: search_date_id {
        type: date
        sql: ${TABLE}."SEARCH_DATE" ;;
        primary_key: yes
      }


      dimension: num_daily_searches_dim {
        type: number
        sql: ${TABLE}."NUM_DAILY_SEARCHES" ;;
      }

      measure: searches {
        type: sum
        sql:${num_daily_searches_dim} ;;
      }



      dimension: prev_week_searches_by_resort {
        type: number
        sql: ${TABLE}."PREV_WEEK_SEARCHES_BY_RESORT" ;;
      }
      dimension: Resort_id {
        type: string
        sql: ${TABLE}."RESORT_ID" ;;
      }

    dimension: Resort {
      type: string
      sql: ${TABLE}."RESORT_NAME" ;;
    }

    dimension: Search_destination {
      type: string
      sql: ${TABLE}."SEARCHED_FOR" ;;
    }


      dimension_group: search {
        type: time
        timeframes: [raw, date, week, month, quarter, year]
        convert_tz: no
        datatype: date
        sql: ${TABLE}."SEARCH_DATE" ;;
      }
      dimension: Search_type {
        type: string
        sql: ${TABLE}."SEARCH_TYPE" ;;
      }
      dimension_group: week_start {
        type: time
        timeframes: [raw, date, week, month, quarter, year]
        convert_tz: no
        datatype: date
        sql: ${TABLE}."WEEK_START_DATE" ;;
      }
      dimension: weekly_searches_dim {
        type: number
        sql: ${TABLE}."WEEKLY_SEARCHES" ;;
      }
      dimension: weekly_searches_wow_change_by_resort_dim {
        type: number
        sql: ${TABLE}."WEEKLY_SEARCHES_WOW_CHANGE_BY_RESORT" ;;
      }

# Total WoW searches Change
    measure: wow_searches_by_destination {
      type: number
      sql:
          (${searches} -
          LAG(${searches}, 1) OVER (partition by ${Search_destination}  ORDER BY ${search_week}))
           / NULLIF(LAG(${searches}, 1) OVER (partition by ${Search_destination} ORDER BY ${search_week}), 0) ;;
      value_format_name: "percent_0"
    }

#      measure: wow_searches_by_resort {
#        type: average
#        sql:   ${weekly_searches_wow_change_by_resort_dim};;
#        value_format_name: "percent_0"
#      }

}
