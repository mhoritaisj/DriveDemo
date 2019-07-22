/// 
Class DriveDemo.DemoProcessRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.VDocRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.VDocRoutingEngine" production="DriveDemo.Production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<constraint name="source" value="MQTTIn"></constraint>
<constraint name="msgClass" value="EnsLib.EDI.XML.Document"></constraint>
<constraint name="docCategory" value="mqtt_schema_driverecord"></constraint>
<constraint name="docName" value="message"></constraint>
<when condition="Piece(Document.{type},&quot;/&quot;,3,3)=&quot;start&quot;">
<send transform="DriveDemo.VDocToCarRegisterRequest" target="CarOperation"></send>
</when>
<when condition="Piece(Document.{type},&quot;/&quot;,3,3)=&quot;drive&quot;">
<send transform="DriveDemo.VDocToCheckDriveRequest" target="CheckDriveProcess"></send>
<send transform="DriveDemo.VDocToStringContainer" target="CarOperation"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
