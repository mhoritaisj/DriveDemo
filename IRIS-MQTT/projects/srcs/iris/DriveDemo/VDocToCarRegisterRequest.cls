Class DriveDemo.VDocToCarRegisterRequest Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.EDI.XML.Document, DriveDemo.Request.CarRegisterRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.EDI.XML.Document' targetClass='DriveDemo.Request.CarRegisterRequest' sourceDocType='mqtt_schema_driverecord:message' create='new' language='objectscript' >
<assign value='..Piece(source.{type},"/",2)' property='target.CarId' action='set' />
<assign value='source.{DriveRecord.starttime}' property='target.StartTime' action='set' />
<assign value='..Piece(source.{type},"/",3)' property='target.Type' action='set' />
</transform>
}

}
