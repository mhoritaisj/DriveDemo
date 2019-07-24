Class DriveDemo.Operation.CheckDriveOperation Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

/// 2 modes: Queue, InProc
Parameter INVOCATION = "Queue";

XData MessageMap
{
<MapItem MessageType="DriveDemo.Request.CheckDriveRequest">
        <Method>CheckDrive</Method>
    </MapItem>
}

Method CheckDrive(pRequest As DriveDemo.Request.CheckDriveRequest, Output pResponse As DriveDemo.Response.CheckDriveResponse) As %Status
{
    Set pResponse=##class(DriveDemo.Response.CheckDriveResponse).%New()
    Set pResponse.hasEvent = 0
    Set pResponse.DrivingBehavior = ##class(DriveDemo.Data.DrivingBehavior).%New()

    Set tCarId = pRequest.CarId
    Set tRelTm = pRequest.RelativeTm
    &sql(SELECT AVG(speed) into :tAvgSpeed FROM DriveDemo_Data.DriveRecord WHERE CarId = :tCarId and RelativeTm BETWEEN :tRelTm - 5 AND :tRelTm)
    $$$TRACE("Car ID: "_tCarId_", Average Speed: "_tAvgSpeed)

    &sql(SELECT EngineRPM into :tEngineRPM FROM DriveDemo_Data.DriveRecord WHERE CarId = :tCarId and RelativeTm = :tRelTm)
    $$$TRACE("Car ID: "_tCarId_", RPM: "_$g(tEngineRPM))   
    if (SQLCODE = 0) & (+$g(tEngineRPM) > 3000) {
        Set pResponse.hasEvent = 1
        Set pResponse.DrivingBehavior.IsHighEngineRPM = 1
        Set pResponse.MessageText = "エンジン高回転: "_tEngineRPM_", Car ID: "_pRequest.CarId
    }
 

    Quit $$$OK
}

}
