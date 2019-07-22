Class DriveDemo.Data.CarLatest Extends %Persistent
{

Property CarId As %String;

Property Tm As %TimeStamp;

Property RelativeTm As %Integer;

Property Longitude As %Float;

Property Latitude As %Float;

Property Azimuth As %Float;

Property Speed As %Float;

Property EngineRPM As %Float;

Property AccelPos As %Float;

Property BrakeSW As %Boolean;

Property AcumDistance As %Float;

Property AcumFuel As %Float;

Property FuelInjection As %Float;

Property aX As %Float;

Property aY As %Float;

Property aZ As %Float;

Index MainIdx On CarId;

Index TmIdx On Tm;

Storage Default
{
<Data name="CarLatestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CarId</Value>
</Value>
<Value name="3">
<Value>Tm</Value>
</Value>
<Value name="4">
<Value>Longitude</Value>
</Value>
<Value name="5">
<Value>Latitude</Value>
</Value>
<Value name="6">
<Value>Azimuth</Value>
</Value>
<Value name="7">
<Value>Speed</Value>
</Value>
<Value name="8">
<Value>EngineRPM</Value>
</Value>
<Value name="9">
<Value>AccelPos</Value>
</Value>
<Value name="10">
<Value>BrakeSW</Value>
</Value>
<Value name="11">
<Value>AcumDistance</Value>
</Value>
<Value name="12">
<Value>AcumFuel</Value>
</Value>
<Value name="13">
<Value>FuelInjection</Value>
</Value>
<Value name="14">
<Value>aX</Value>
</Value>
<Value name="15">
<Value>aY</Value>
</Value>
<Value name="16">
<Value>aZ</Value>
</Value>
<Value name="17">
<Value>RelativeTm</Value>
</Value>
</Data>
<DataLocation>^DriveDemo.Data.CarLatestD</DataLocation>
<DefaultData>CarLatestDefaultData</DefaultData>
<IdLocation>^DriveDemo.Data.CarLatestD</IdLocation>
<IndexLocation>^DriveDemo.Data.CarLatestI</IndexLocation>
<StreamLocation>^DriveDemo.Data.CarLatestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
