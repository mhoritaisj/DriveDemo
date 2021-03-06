Class DriveDemo.Response.CheckDriveResponse Extends Ens.Response [ ClassType = persistent, ProcedureBlock ]
{

Property hasEvent As %Boolean;

Property DrivingBehavior As DriveDemo.Data.DrivingBehavior;

Property MessageText As %String(MAXLEN = 32767);

Storage Default
{
<Data name="CarUpdateRequestDefaultData">
<Subscript>"CarUpdateRequest"</Subscript>
<Value name="1">
<Value>hasEvent</Value>
</Value>
<Value name="2">
<Value>DrivingBehavior</Value>
</Value>
<Value name="3">
<Value>MessageText</Value>
</Value>
</Data>
<DefaultData>CarUpdateRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
