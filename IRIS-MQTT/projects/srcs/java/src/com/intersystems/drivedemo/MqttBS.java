package com.intersystems.drivedemo;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.Instant;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

import com.intersystems.gateway.bh.BusinessService;
import com.intersystems.gateway.bh.Production;
import com.intersystems.gateway.bh.Production.Severity;

//
//DISCLAIMER HERE!!!
//

//ビジネスサービスを実装


public class MqttBS implements BusinessService, MqttCallback {

	public static final String SETTINGS = "MQTTBroker,MQTTClientName,MQTTTopicRoot,LogFile";
	private String mqttBroker="tcp://localhost:1883";
	private String mqttPort="1883";
	private String mqttClientName="InterSystemsIRIS";
	private String mqttTopicRoot="/iris-test"; 

	private PrintWriter logFile = new PrintWriter(System.out, true);
	private MemoryPersistence persistence;
	private MqttClient mqttClient;
	private MqttConnectOptions mqttConnOpts;
	
	private Production production;

@Override
public boolean OnTearDown() throws Exception {
	mqttClient.disconnect();
	return true;
}



@Override
public boolean OnInit(Production prod) throws Exception {
    try {
    	 production=prod;
	     mqttBroker = production.GetSetting("MQTTBroker");
	     mqttClientName = production.GetSetting("MQTTClientName");
	     mqttTopicRoot = production.GetSetting("MQTTTopicRoot");
	     mqttClient = new MqttClient(mqttBroker, mqttClientName);
         mqttConnOpts = new MqttConnectOptions();
         mqttConnOpts.setCleanSession(true);
         //logFile.println("Connecting to broker: "+mqttBrocker);
         mqttClient.connect(mqttConnOpts);
         //logFile.println("Connected");
         production.LogMessage("Successfully connected to MQTT broker: "+mqttBroker,Severity.INFO);
		 String[]myTopics={this.mqttTopicRoot};
		 mqttClient.subscribe(myTopics);  //use Default QoS
		 production.LogMessage("Subscribed to MQTT topic: "+mqttTopicRoot,Severity.TRACE);
		 mqttClient.setCallback(this);
	     production.LogMessage("Successfully connected to MQTT broker: "+mqttBroker,Severity.INFO);
	     return true;
	}
	catch (Exception e) {
		//System.out.println(e.toString());
		production.LogMessage(e.toString(), Severity.ERROR);
		production.SetStatus(Production.Status.ERROR);
	}
	return false;
}
@Override
public void messageArrived(String topic, MqttMessage message) throws Exception {
	production.LogMessage("java, messageArrived", Severity.TRACE);
	production.LogMessage("java, topic:  "+topic+"; Message:"+message.toString(),Production.Severity.TRACE);
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    Instant ts = timestamp.toInstant();
	String xmlMessage="<message><type>"+topic+"</type><timestamp>"+ts+"</timestamp><content>"+message.toString()+"</content></message>";
	
	production.LogMessage("java, xmlMessage:"+xmlMessage,Severity.TRACE);
	production.SendRequest(xmlMessage);
}



@Override
public void connectionLost(Throwable arg0) {
	try {
		production.LogMessage("MQTT connection lost to "+mqttBroker, Severity.WARN);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	// TODO Auto-generated method stub
	
}



@Override
public void deliveryComplete(IMqttDeliveryToken arg0) {
	// TODO Auto-generated method stub
	
}
}
