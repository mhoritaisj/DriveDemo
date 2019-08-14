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

    &sql(SELECT EngineRPM, aX, aY into :tEngineRPM, :taX, :taY FROM DriveDemo_Data.DriveRecord WHERE CarId = :tCarId and RelativeTm = :tRelTm)
    $$$TRACE("Car ID: "_tCarId_", RPM: "_$g(tEngineRPM)) 
    
    Set tMsgTxt = ""
    Set tDlm = ""
    if SQLCODE = 0 {
        if +$g(tAvgSpeed) > 100 {
            Set pResponse.hasEvent = 1
            Set pResponse.DrivingBehavior.IsOverSpeed = 1
            Set tMsgTxt = tMsgTxt_tDlm_"Average Speed: "_$fnumber(tAvgSpeed, "", 2)_" km/h"
            Set tDlm = " , "
        }
        if +$g(tEngineRPM) > 3000 {
            Set pResponse.hasEvent = 1
            Set pResponse.DrivingBehavior.IsHighEngineRPM = 1
            Set tMsgTxt = tMsgTxt_tDlm_"Engine RPM: "_tEngineRPM_" rpm"
            Set tDlm = " , "
        }
        if $zabs(+$g(taX)) > 300 {
            Set pResponse.hasEvent = 1
            Set pResponse.DrivingBehavior.IsHighXG = 1
            Set tMsgTxt = tMsgTxt_tDlm_"X acceleration: "_$fnumber((taX / 1000.0), "+", 3)_" G"
            Set tDlm = " , "
        }
        if $zabs(+$g(taY)) > 200 {
            Set pResponse.hasEvent = 1
            Set pResponse.DrivingBehavior.IsHighYG = 1
            Set tMsgTxt = tMsgTxt_tDlm_"Y acceleration: "_$fnumber((taY / 1000.0), "+", 3)_" G"
            Set tDlm = " , "
        }

        if pResponse.hasEvent = 1 {
            Set tMsgTxt = tMsgTxt_tDlm_"Car ID: "_pRequest.CarId
        }
    }

    Set pResponse.MessageText = tMsgTxt
 

    Quit $$$OK
}

}
