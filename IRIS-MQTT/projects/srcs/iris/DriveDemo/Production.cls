Class DriveDemo.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="DriveDemo.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>5</ActorPoolSize>
  <Item Name="EnsLib.JavaGateway.Initiator" Category="" ClassName="EnsLib.JavaGateway.Initiator" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ClassPath">/projects/srcs/java/lib/org.eclipse.paho.client.mqttv3-1.2.0.jar</Setting>
  </Item>
  <Item Name="RoutingProcess" Category="" ClassName="EnsLib.MsgRouter.VDocRoutingEngine" PoolSize="5" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">DriveDemo.DemoProcessRoutingRule</Setting>
  </Item>
  <Item Name="MQTTIn" Category="" ClassName="JBH.Com.Intersystems.Drivedemo.MqttBS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="DocSchemaCategory">mqtt_schema_driverecord</Setting>
    <Setting Target="Host" Name="MQTTBroker">tcp://mqttbroker:1883</Setting>
    <Setting Target="Host" Name="MQTTClientName">InterSystemsIRIS</Setting>
    <Setting Target="Host" Name="MQTTTopicRoot">DriveDemo/#</Setting>
    <Setting Target="Host" Name="TargetConfigNames">RoutingProcess</Setting>
  </Item>
  <Item Name="CarOperation" Category="" ClassName="DriveDemo.Operation.CarUpdateOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="CheckDriveOperation" Category="" ClassName="DriveDemo.Operation.CheckDriveOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="CheckDriveProcess" Category="" ClassName="DriveDemo.Process.CheckDriveProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
