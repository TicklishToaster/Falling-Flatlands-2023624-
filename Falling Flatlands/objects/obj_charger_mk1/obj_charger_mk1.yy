{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_charger_mk1",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [],
  "parent": {
    "name": "Charger",
    "path": "folders/Objects/Faction Enemy/Charger.yy",
  },
  "parentObjectId": {
    "name": "obj_faction_enemy_charger",
    "path": "objects/obj_faction_enemy_charger/obj_faction_enemy_charger.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"health_points_max","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"health_points","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"health_points_max","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"max_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"max_speed_default","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"max_speed","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"max_speed_boosted","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"20","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"acceleration","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.03","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"rotation_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.6","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"proximity_radius","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"96","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"charge_timer_max","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"3","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"charge_timer","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"charge_timer_max","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"boosted_timer_max","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1.0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"boosted_timer","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"boosted_timer_max","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"destroy_score","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"10","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_enemy_charger",
    "path": "sprites/spr_enemy_charger/spr_enemy_charger.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}