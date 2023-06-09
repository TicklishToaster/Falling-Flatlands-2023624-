{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_hunter_mk1",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [],
  "parent": {
    "name": "Hunter",
    "path": "folders/Objects/Faction Enemy/Hunter.yy",
  },
  "parentObjectId": {
    "name": "obj_faction_enemy_hunter",
    "path": "objects/obj_faction_enemy_hunter/obj_faction_enemy_hunter.yy",
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
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"health_points_max","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2.0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"health_points","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"health_points_max","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"max_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2.5","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"acceleration","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.04","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"rotation_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.8","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"attack_cooldown_timer_max","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2.0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"attack_cooldown_timer","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"attack_cooldown_timer_max","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"destroy_score","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"10","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_enemy_hunter",
    "path": "sprites/spr_enemy_hunter/spr_enemy_hunter.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}