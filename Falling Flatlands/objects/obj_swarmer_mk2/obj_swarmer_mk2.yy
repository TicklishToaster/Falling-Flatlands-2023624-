{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_swarmer_mk2",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_faction_enemy","path":"objects/obj_faction_enemy/obj_faction_enemy.yy",},"propertyId":{"name":"enemy_colour_blend","path":"objects/obj_faction_enemy/obj_faction_enemy.yy",},"value":"$FF3232FF",},
  ],
  "parent": {
    "name": "Swarmer",
    "path": "folders/Objects/Faction Enemy/Swarmer.yy",
  },
  "parentObjectId": {
    "name": "obj_faction_enemy_swarmer",
    "path": "objects/obj_faction_enemy_swarmer/obj_faction_enemy_swarmer.yy",
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
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"health_points_max","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"irandom_range(2, 4)","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"health_points","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"health_points_max","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"max_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"3.0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"acceleration","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.04","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"rotation_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2.0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"destroy_score","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"30","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"swarmer_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"5","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"swarmer_rotation","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.6","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"swarmer_rotation_max","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"4.0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"swarmer_radius","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"64","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_enemy_swarmer_core",
    "path": "sprites/spr_enemy_swarmer_core/spr_enemy_swarmer_core.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}