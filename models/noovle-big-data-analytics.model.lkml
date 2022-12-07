connection: "noovle_private_cloud_bi_hackathon_2022_output"

# include all the views
include: "/views/**/*.view"

datagroup: noovle-big-data-analytics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: noovle-big-data-analytics_default_datagroup

explore: test_connection_looker {}


explore: v_google_consumption {
  join: v_google_consumption__labels {
    view_label: "V Google Consumption: Labels"
    sql: LEFT JOIN UNNEST(${v_google_consumption.labels}) as v_google_consumption__labels ;;
    relationship: one_to_many
  }

  join: v_google_consumption__credits {
    view_label: "V Google Consumption: Credits"
    sql: LEFT JOIN UNNEST(${v_google_consumption.credits}) as v_google_consumption__credits ;;
    relationship: one_to_many
  }

  join: v_google_consumption__system_labels {
    view_label: "V Google Consumption: System Labels"
    sql: LEFT JOIN UNNEST(${v_google_consumption.system_labels}) as v_google_consumption__system_labels ;;
    relationship: one_to_many
  }

  join: v_google_consumption__project__labels {
    view_label: "V Google Consumption: Project Labels"
    sql: LEFT JOIN UNNEST(${v_google_consumption.project__labels}) as v_google_consumption__project__labels ;;
    relationship: one_to_many
  }

  join: v_google_consumption__project__ancestors {
    view_label: "V Google Consumption: Project Ancestors"
    sql: LEFT JOIN UNNEST(${v_google_consumption.project__ancestors}) as v_google_consumption__project__ancestors ;;
    relationship: one_to_many
  }
}
