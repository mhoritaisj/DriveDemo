Class DriveDemo.Request.CarRegisterRequest Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property CarId As %String;

Property StartTime As %TimeStamp;

Property Type As %String;

Storage Default
{
<Data name="CarRegisterRequestDefaultData">
<Subscript>"CarRegisterRequest"</Subscript>
<Value name="1">
<Value>CarId</Value>
</Value>
<Value name="2">
<Value>StartTime</Value>
</Value>
<Value name="3">
<Value>Type</Value>
</Value>
</Data>
<DefaultData>CarRegisterRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
