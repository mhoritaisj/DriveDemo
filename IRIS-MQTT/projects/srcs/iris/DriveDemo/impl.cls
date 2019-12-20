/// Drive Demo: REST APIの定義<br/>
/// Business logic class defined by OpenAPI in DriveDemo.spec<br/>
/// Updated Dec 20, 2019 16:53:15
Class DriveDemo.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// すべての車の情報を返す
ClassMethod getAllCars() As %DynamicObject
{
    // SQLで車の最新情報を取得し、DynamicObjectを生成する
    Set tArr = []
    Set tRS = ##class(%SQL.Statement).%ExecDirect(,"SELECT CarId, RelativeTm, Longitude, Latitude, Azimuth, Speed, EngineRPM, AccelPos, BrakeSW, aX, aY, aZ FROM DriveDemo_Data.CarLatest order by CarId")
    While tRS.%Next() {
        Do tArr.%Push({
            "carid":    (tRS.%Get("CarId")),
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
    Quit tArr.%ToJSON()
}

}
