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

    Set tRelTm = pRequest.RelativeTm
    &sql(SELECT AVG(speed) into :tAvgSpeed FROM DriveDemo_Data.DriveRecord WHERE RelativeTm BETWEEN :tRelTm - 5 AND :tRelTm)
    $$$TRACE("Car ID: "_pRequest.CarId_", Average Speed: "_tAvgSpeed)


    Quit $$$OK
}

}
