{
    "id": "251fc7c0-2d37-4ce0-a5e2-1cce6a5ce390",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "oBomb",
    "eventList": [
        {
            "id": "b7b8811f-cc36-47ac-8bee-7f72c1b02cd9",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "251fc7c0-2d37-4ce0-a5e2-1cce6a5ce390"
        },
        {
            "id": "b7ddede4-ba8c-4bfa-b5da-6ad27c4d5594",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 8,
            "m_owner": "251fc7c0-2d37-4ce0-a5e2-1cce6a5ce390"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "00000000-0000-0000-0000-000000000000",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "7516ba32-68db-4e5c-998b-3a40ed2ad13d",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "room_speed * 3",
            "varName": "mMaxFuse",
            "varType": 1
        },
        {
            "id": "e6e8c1f0-c5ec-4c77-b791-d9d57ce46843",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "mMaxFuse",
            "varName": "mFuse",
            "varType": 1
        },
        {
            "id": "561a9f1e-bb1d-47cc-b3bb-63c2d46bb23f",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "x",
            "varName": "mTargetX",
            "varType": 0
        },
        {
            "id": "f1c74036-eefb-4d75-be65-1f2be0284214",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "y",
            "varName": "mTargetY",
            "varType": 0
        },
        {
            "id": "13337d75-8231-429f-ba26-4a1b6d025886",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "-1",
            "varName": "mMovementTimer",
            "varType": 1
        }
    ],
    "solid": false,
    "spriteId": "76835cbd-9eb8-4d39-bc27-dda7060ba32d",
    "visible": true
}