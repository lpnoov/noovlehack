# The name of this view in Looker is "V Google Consumption"
view: v_google_consumption {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `noovle-big-data-analytics.CLOUD_BI_HACKATHON_2022_OUTPUT.V_GOOGLE_CONSUMPTION`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cost" in Explore.

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
  }

  dimension: credits_amount {
    type: number
    sql: ${TABLE}.credits_amount ;;
  }

  dimension: credits_id {
    type: string
    sql: ${TABLE}.credits_id ;;
  }

  dimension: credits_name {
    type: string
    sql: ${TABLE}.credits_name ;;
  }

  dimension: credits_type {
    type: string
    sql: ${TABLE}.credits_type ;;
  }

  dimension: project_ancestors_display_name {
    type: string
    sql: ${TABLE}.project_ancestors_display_name ;;
  }

  dimension: service_description {
    type: string
    sql: ${TABLE}.service_description ;;
  }

  dimension: sku_description {
    type: string
    sql: ${TABLE}.sku_description ;;
  }

  measure: count {
    type: count
    drill_fields: [project_ancestors_display_name, credits_name]
  }
}
