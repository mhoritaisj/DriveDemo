Class DriveDemo.VDocToStringContainer Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.EDI.XML.Document, DriveDemo.Request.CarUpdateRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.EDI.XML.Document' targetClass='DriveDemo.Request.CarUpdateRequest' sourceDocType='mqtt_schema_driverecord:message' create='new' language='objectscript' >
<assign value='source.{DriveRecord}' property='target.Data' action='set' />
<assign value='..Piece(source.{type},"/",2)' property='target.Data.CarId' action='set' />
<assign value='source.{DriveRecord.time}' property='target.Data.RelativeTm' action='set' />
<assign value='source.{DriveRecord.longitude}' property='target.Data.Longitude' action='set' />
<assign value='source.{DriveRecord.azimuth}' property='target.Data.Azimuth' action='set' />
<assign value='source.{DriveRecord.car_speed}' property='target.Data.Speed' action='set' />
<assign value='source.{DriveRecord.engine_rpm}' property='target.Data.EngineRPM' action='set' />
<assign value='source.{DriveRecord.accel_pos}' property='target.Data.AccelPos' action='set' />
<assign value='source.{DriveRecord.brake_sw}' property='target.Data.BrakeSW' action='set' />
<assign value='source.{DriveRecord.accum_dist}' property='target.Data.AcumDistance' action='set' />
<assign value='source.{DriveRecord.accum_fuel}' property='target.Data.AcumFuel' action='set' />
<assign value='source.{DriveRecord.fuel_injection}' property='target.Data.FuelInjection' action='set' />
<assign value='source.{DriveRecord.a_000_x}' property='target.Data.aX' action='set' />
<assign value='source.{DriveRecord.a_000_y}' property='target.Data.aY' action='set' />
<assign value='source.{DriveRecord.a_000_z}' property='target.Data.aZ' action='set' />
<assign value='source.{DriveRecord.latitude}' property='target.Data.Latitude' action='set' />
</transform>
}

}
