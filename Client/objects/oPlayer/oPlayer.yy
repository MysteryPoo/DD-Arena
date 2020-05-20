{
    "id": "6f475977-3851-4443-b03a-9631528b6e22",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "oPlayer",
    "eventList": [
        {
            "id": "01b600b7-bf7d-4a80-bfca-f7dc8794c42b",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "6f475977-3851-4443-b03a-9631528b6e22"
        },
        {
            "id": "525b64c4-51c1-40bb-a7d0-d543858a34e8",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 8,
            "m_owner": "6f475977-3851-4443-b03a-9631528b6e22"
        },
        {
            "id": "f01cc723-c780-4086-9c18-492f6e79d12c",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 2,
            "m_owner": "6f475977-3851-4443-b03a-9631528b6e22"
        },
        {
            "id": "b47b6f99-4088-4b05-afc8-0387fdedf5aa",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 1,
            "eventtype": 2,
            "m_owner": "6f475977-3851-4443-b03a-9631528b6e22"
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
            "id": "2d91f4df-86bc-4865-a77b-6461ea480f3b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "noone",
            "varName": "mController",
            "varType": 1
        },
        {
            "id": "25b601dc-30e5-4b98-9cf1-7a92d738c6b8",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "noone",
            "varName": "mBomb",
            "varType": 1
        },
        {
            "id": "5b8e1c54-0b4c-4f6c-bb37-c29148e5fcbf",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "mIsMoving",
            "varType": 3
        },
        {
            "id": "718bdad0-dd26-4644-ab67-0dff4655ee5c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "True",
            "varName": "mCanDeflect",
            "varType": 3
        },
        {
            "id": "a59303fa-6882-49f1-a26c-dc5c31865e59",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": true,
            "rangeMax": 3,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "3",
            "varName": "mDeflectCooldown",
            "varType": 0
        },
        {
            "id": "f9320e0a-10fd-4f59-9c90-291d7b73c77b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "256",
            "varName": "mThrowRange",
            "varType": 1
        },
        {
            "id": "89d35eed-7ce0-4e22-94cf-dc91e771ce77",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "True",
            "varName": "mCanThrow",
            "varType": 3
        },
        {
            "id": "b16d6fa6-b740-4f2a-85df-cec23fb7ec86",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": true,
            "rangeMax": 3,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "mCanThrowCooldown",
            "varType": 0
        },
        {
            "id": "8b68b5cb-62b9-4701-9c32-f3b0933064fb",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": true,
            "rangeMax": 5,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "mBombCount",
            "varType": 1
        }
    ],
    "solid": false,
    "spriteId": "704ae449-654f-484b-911c-3bc87e540320",
    "visible": true
}