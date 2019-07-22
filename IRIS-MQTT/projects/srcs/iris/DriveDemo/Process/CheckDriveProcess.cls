/// 
Class DriveDemo.Process.CheckDriveProcess Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='DriveDemo.Request.CheckDriveRequest' response='DriveDemo.Response.CheckDriveResponse' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<call name='CheckDrivingBehavior' target='CheckDriveOperation' async='0' xpos='200' ypos='250' >
<request type='DriveDemo.Request.CheckDriveRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='DriveDemo.Response.CheckDriveResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
