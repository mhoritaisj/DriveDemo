Class DriveDemo.Request.CarUpdateRequest Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property Data As DriveDemo.Data.DriveRecord;

// Property jsonData As %XML.String(MAXLEN = 32767);

Storage Default
{
<Data name="CarUpdateRequestDefaultData">
<Subscript>"CarUpdateRequest"</Subscript>
<Value name="1">
<Value>CarId</Value>
</Value>
<Value name="2">
<Value>jsonData</Value>
</Value>
<Value name="3">
<Value>Data</Value>
</Value>
</Data>
<DefaultData>CarUpdateRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
