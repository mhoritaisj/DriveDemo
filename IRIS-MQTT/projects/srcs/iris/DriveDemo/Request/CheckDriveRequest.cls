Class DriveDemo.Request.CheckDriveRequest Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property CarId As %String;

Property RelativeTm As %Integer;

Storage Default
{
<Data name="CheckDriveRequestDefaultData">
<Subscript>"CheckDriveRequest"</Subscript>
<Value name="1">
<Value>CarId</Value>
</Value>
<Value name="2">
<Value>RelativeTm</Value>
</Value>
</Data>
<DefaultData>CheckDriveRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
