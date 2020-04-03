Class DriveDemo.Data.DrivingBehavior Extends (%SerialObject, %XML.Adaptor)
{

Property IsOverSpeed As %Boolean;

Property IsHighEngineRPM As %Boolean;

Property IsHighXG As %Boolean;

Property IsHighYG As %Boolean;

Storage Default
{
<Data name="DrivingBehaviorState">
<Value name="1">
<Value>IsOverSpeed</Value>
</Value>
<Value name="2">
<Value>IsHighEngineRPM</Value>
</Value>
<Value name="3">
<Value>IsHighXG</Value>
</Value>
<Value name="4">
<Value>IsHighYG</Value>
</Value>
</Data>
<State>DrivingBehaviorState</State>
<StreamLocation>^DriveDemo.DaFC.DrivingBehaF5BDS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
