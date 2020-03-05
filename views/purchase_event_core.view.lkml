include: "//@{CONFIG_PROJECT_NAME}/views/purchase_event.view.lkml"


view: purchase_event {
  extends: [purchase_event_config]
}

###################################################

view: purchase_event_core {
  sql_table_name: braze.PURCHASE_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: device_id {
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: properties {
    type: string
    sql: ${TABLE}.properties ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, device.id]
  }
}
