#!usr/bin/env python
# -*- coding: utf-8 -*- 

#
# 車載器データ(CSV)を、1レコード/秒のペースでMQTTブローカにpublishするプログラム
#

import numpy as np
import pandas as pd
import time
import json
import paho.mqtt.client as mqtt
import datetime
import threading

# MQTTブローカに接続した時のコールバック
def on_connect(client, userdata, flag, rc):
  print("Connected : code: " + str(rc))

# MQTTブローカから切断した時のコールバック
def on_disconnect(client, userdata, flag, rc):
  if rc != 0:
     print("Disconnected")

# MQTTブローカへのpublishが完了した時のコールバック
def on_publish(client, userdata, mid):
  print("Published: {0}".format(mid))

def date_parser(string_list):
    return [time.ctime(float(x)) for x in string_list]

# DataFrameのrowをXMLに変換する
def row_to_xml(row):
  xml = ['<DriveRecord>']
  for field in row.index:
    if row[field] != row[field]:
      val = ''
    else:
      val = str(row[field])
    if field not in [ 'idle_sw', 'ac', 'light_sw', 'steering_torque', 'shift_pos', 'shift_mode', 'blinker', 'wiper', 'odometer', 'soc', 'air_temp_setting1', 'air_temp_setting2', 'air_temp_setting3', 'air_fan1', 'air_fan2', 'air_fan3', 'ext_int_air', 'door_lock', 'door_open', 'seatbelt', 'abs', 'temperature', 'motor_temperature', 'electric_mileage']:
      xml.append("<" + field + ">" + val + "</" + field + ">")
  xml.append("</DriveRecord>")
  return ' '.join(xml)

# 各車に対しスレッド内で実行されるメソッド
def run(client, drivedata, num):
    carid = '{:0=2d}'.format(num)
    # データ開始時刻
    now = datetime.datetime.now()
    client.publish("DriveDemo/car" + carid + "/start", '<DriveRecord> <starttime>' + str(now) + '</starttime> </DriveRecord>')
    time.sleep(1)

    for k, r in drivedata.iterrows():
      client.publish("DriveDemo/car" + carid + "/drive", row_to_xml(r))
      time.sleep(1)
      
    now = datetime.datetime.now()
    client.publish("DriveDemo/car" + carid + "/stop", '<DriveRecord> <starttime>' + str(now) + '</starttime> </DriveRecord>')


if __name__ == '__main__':
  num_of_clients = 14
  clientlist = []
  drivedatalist = []
  threadlist = []

  # 車ごとにMQTTブローカに接続し、CSVファイルからDataFrameを作成、スレッドオブジェクトを作成する
  for i in range(num_of_clients):
    carnum = i + 1

    # MQTTブローカに接続し、コールバックを設定
    client = mqtt.Client()                 
    client.on_connect = on_connect         
    client.on_disconnect = on_disconnect   
    client.on_publish = on_publish         
    client.connect("mqttbroker", 1883, 60) 

    # 通信処理スタート
    client.loop_start()    
    clientlist.append(client)

    drivedata = pd.read_csv('/data/drivedata' + str(carnum) + '.csv')

    # timeフィールドを相対秒数に変換
    drivedata['time'] = [x - drivedata['time'][0] for x in drivedata['time']]
    drivedatalist.append(drivedata)

    # スレッドを作成
    threadlist.append(threading.Thread(target=run, args=(client, drivedata, carnum)))

  # 車ごとのスレッドを開始
  for i in range(num_of_clients):
    th = threadlist[i]
    th.start()
  
