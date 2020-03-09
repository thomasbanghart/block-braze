include: "//@{CONFIG_PROJECT_NAME}/views/canvas_entry_event.view.lkml"


view: canvas_entry_event {
  extends: [canvas_entry_event_config]
}

###################################################

view: canvas_entry_event_core {
  sql_table_name: braze.CANVAS_ENTRY_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: canvas_id {
    type: number
    sql: ${TABLE}.canvas_id ;;
    description: "id of the Canvas if from a canvas"
  }

  dimension: canvas_step_id {
    type: number
    sql: ${TABLE}.canvas_step_id ;;
    description: "id of the step for this message if from a Canvas"
  }

  dimension: canvas_step_updated_at {
    type: string
    sql: ${TABLE}.canvas_step_updated_at ;;
  }

  dimension: canvas_updated_at {
    type: string
    sql: ${TABLE}.canvas_updated_at ;;
  }

  dimension: canvas_variation_id {
    type: number
    sql: ${TABLE}.canvas_variation_id ;;
    description: "id of the canvas variation the user is in if from a Canvas"
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
    description: "external ID of the user"

  }

  dimension: in_control_group {
    type: yesno
    sql: ${TABLE}.in_control_group ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
    description: "IANA timezone of the user at the time of the event"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description:"braze user id of the user"
  }

  measure: count {
    type: count
    drill_fields: [id, canvas_step.canvas_step_name, canvas_step.id, canvas.name, canvas.id]
  }
}