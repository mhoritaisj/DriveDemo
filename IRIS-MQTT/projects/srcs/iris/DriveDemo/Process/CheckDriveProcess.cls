/// 
Class DriveDemo.Process.CheckDriveProcess Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='DriveDemo.Request.CheckDriveRequest' response='DriveDemo.Response.CheckDriveResponse' height='2000' width='2000' >
<context>
<property name='drivingstatus' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='2500' />
</parameters>
</property>
</context>
<sequence xend='200' yend='700' >
<call name='CheckDrivingBehavior' target='CheckDriveOperation' async='0' xpos='200' ypos='250' >
<request type='DriveDemo.Request.CheckDriveRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='DriveDemo.Response.CheckDriveResponse' >
<assign property="context.drivingstatus" value="callresponse.MessageText" action="set" />
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<if name='EventHappened?' condition='response.hasEvent = 1' xpos='200' ypos='350' xend='200' yend='600' >
<true>
<call name='NotifyEvent' target='MQTTOut' async='1' xpos='335' ypos='500' >
<request type='Ens.StringContainer' >
<assign property="callrequest.StringValue" value="response.MessageText" action="set" />
</request>
<response type='Ens.Response' />
</call>
</true>
</if>
</sequence>
</process>
}

}
