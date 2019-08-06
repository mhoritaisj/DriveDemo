/// Drive Demo: REST APIの定義<br/>
/// Business logic class defined by OpenAPI in DriveDemo.spec<br/>
/// Updated Aug 6, 2019 15:21:49
Class DriveDemo.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// すべての車の情報を返す
ClassMethod getAllCars() As %DynamicObject
{
    Set tArr = []
    Set tRS = ##class(%SQL.Statement).%ExecDirect(,"SELECT CarId, RelativeTm, Longitude, Latitude, Azimuth, Speed, EngineRPM, AccelPos, BrakeSW, aX, aY, aZ FROM DriveDemo_Data.CarLatest")
    While tRS.%Next() {
        Do tArr.%Push({
            "id":    (tRS.%Get("CarId")),
            "relativetm":    (tRS.%Get("RelativeTm")),
            "longitude":    (tRS.%Get("Longitude")),
            "latitude":    (tRS.%Get("Latitude")),
            "azimuth":    (tRS.%Get("Azimuth")),
            "speed":    (tRS.%Get("Speed")),
            "enginerpm":    (tRS.%Get("EngineRPM")),
            "accelpos":    (tRS.%Get("AccelPos")),
            "brakesw":    (tRS.%Get("BrakeSW")),
            "aX":    (tRS.%Get("aX")),
            "aY":    (tRS.%Get("aY")),
            "aZ":    (tRS.%Get("aZ"))
        })
    }
    Do ..%SetStatusCode(200)
    //Do ..%SetHeader(<name>,<value>)
    Quit tArr.%ToJSON()
}

}
