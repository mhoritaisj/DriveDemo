Class DriveDemo.spec Extends %REST.Spec [ ProcedureBlock ]
{

XData OpenAPI [ MimeType = application/json ]
{
{
  "swagger":"2.0",
  "info":{
    "version":"1.0.0",
    "title":"Drive Demo",
    "description":"Drive Demo: REST APIの定義",
    "termsOfService":"http://swagger.io/terms/",
    "contact":{
      "name":"Swagger API Team"
    },
    "license":{
      "name":"MIT"
    }
  },
  "basePath":"/api",
  "schemes":[
    "http"
  ],
  "consumes":[
    "application/json"
  ],
  "produces":[
    "application/json"
  ],
  "paths":{
    "/cars":{
      "get":{
        "description":"すべての車の情報を返す",
        "operationId":"getAllCars",
        "produces":[
          "application/json"
        ],
        "responses":{
          "200":{
            "description":"車のリスト",
            "schema":{
              "type":"array",
              "items":{
                "$ref":"#/definitions/Car"
              }
            }
          }
        }
      }
    }
  },
  "definitions":{
    "Car":{
      "type":"object",
      "required":[
        "id",
        "speed"
      ],
      "properties":{
        "id":{
          "type":"string"
        },
        "name":{
          "type":"number",
          "format":"float"
        }
      }
    }
  }
}
}

}
