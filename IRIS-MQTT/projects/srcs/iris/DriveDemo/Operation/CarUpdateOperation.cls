Class DriveDemo.Operation.CarUpdateOperation Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

/// 2 modes: Queue, InProc
Parameter INVOCATION = "Queue";

XData MessageMap
{
<MapItems>
    <MapItem MessageType="DriveDemo.Request.CarRegisterRequest">
        <Method>RegisterCar</Method>
    </MapItem>
    <MapItem MessageType="DriveDemo.Request.CarUpdateRequest">
        <Method>UpdateCar</Method>
    </MapItem>
</MapItems>
}

// 車のstartトッピックがきたら、そのCar IDに対しレコードを作成する

Method RegisterCar(pRequest As DriveDemo.Request.CarRegisterRequest, Output pResponse As Ens.Response) As %Status
{
    Set carid = pRequest.CarId
    Set ts = pRequest.StartTime
    $$$TRACE("Car ID: "_carid_",  Time: "_ts)

    // デモ目的のため、以前の同一Car IDのレコードを削除する
    &sql(DELETE FROM DriveDemo_Data.DriveRecord where CarId = :carid)
    &sql(DELETE FROM DriveDemo_Data.CarLatest where CarId = :carid)
    &sql(INSERT INTO DriveDemo_Data.CarLatest (CarId, Tm) values (:carid, :ts))
    
    Quit $$$OK
}

// driveトピックのメッセージがきたら、最新情報テーブルを更新する

Method UpdateCar(pRequest As DriveDemo.Request.CarUpdateRequest, Output pResponse As Ens.Response) As %Status
{
 
    // 現在の運転情報を、CarLatestに記録
    Set tCarId = pRequest.Data.CarId
    Set tRelativeTm = pRequest.Data.RelativeTm
    Set tLongitude = pRequest.Data.Longitude
    Set tLatitude = pRequest.Data.Latitude
    Set tAzimuth = pRequest.Data.Azimuth
    Set tSpeed = pRequest.Data.Speed
    Set tEngineRPM = pRequest.Data.EngineRPM
    Set tAccelPos = pRequest.Data.AccelPos
    Set tBrakeSW = pRequest.Data.BrakeSW
    Set tAcumDistance = pRequest.Data.AcumDistance
    Set tAcumFuel = pRequest.Data.AcumFuel
    Set tFuelInjection = pRequest.Data.FuelInjection
    Set taX = pRequest.Data.aX
    Set taY = pRequest.Data.aY
    Set taZ = pRequest.Data.aZ

    &sql(UPDATE DriveDemo_Data.CarLatest SET RelativeTm = :tRelativeTm, Longitude = :tLongitude, Latitude = :tLatitude, Azimuth = :tAzimuth, Speed = :tSpeed, EngineRPM = :tEngineRPM, AccelPos = :tAccelPos, BrakeSW = :tBrakeSW, AcumDistance = :tAcumDistance, AcumFuel = :tAcumFuel, FuelInjection = :tFuelInjection, aX = :taX, aY = :taY, aZ = :taZ where CarId = :tCarId)
 
    $$$TRACE("Car ID: "_tCarId_",  Speed: "_tSpeed)
 
    Quit $$$OK
}

}
