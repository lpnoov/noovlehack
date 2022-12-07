connection: "noovle_private_cloud_bi_hackathon_2022_output"

# include all the views
include: "/views/**/*.view"

datagroup: noovle-big-data-analytics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: noovle-big-data-analytics_default_datagroup

explore: v_google_consumption {}
