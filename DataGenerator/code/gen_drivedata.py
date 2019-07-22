#!usr/bin/env python
# -*- coding: utf-8 -*- 

import numpy as np
import pandas as pd
import time
import json
import paho.mqtt.client as mqtt
import datetime
import threading

# ブローカーに接続できたときの処理
def on_connect(client, userdata, flag, rc):
  print("Connected with result code " + str(rc))

# ブローカーが切断したときの処理
def on_disconnect(client, userdata, flag, rc):
  if rc != 0:
     print("Unexpected disconnection.")

# publishが完了したときの処理
def on_publish(client, userdata, mid):
  print("publish: {0}".format(mid))

def date_parser(string_list):
    return [time.ctime(float(x)) for x in string_list]

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

def run(client, drivedata, num):
    # データ開始時刻
    now = datetime.datetime.now()
    client.publish("DriveDemo/car" + str(num) + "/start", '<DriveRecord> <starttime>' + str(now) + '</starttime> </DriveRecord>')
    time.sleep(1)

    for k, r in drivedata.iterrows():
      #print(r.to_json())
      #client.publish("DriveDemo/car1/drive", r.to_json())    # トピック名とメッセージを決めて送信
      #print(row_to_xml(r))
      client.publish("DriveDemo/car" + str(num) + "/drive", row_to_xml(r))
      time.sleep(1)
      
    now = datetime.datetime.now()
    client.publish("DriveDemo/car" + str(num) + "/stop", '<DriveRecord> <starttime>' + str(now) + '</starttime> </DriveRecord>')


if __name__ == '__main__':
  num_of_clients = 16
  clientlist = []
  drivedatalist = []
  threadlist = []
  for i in range(num_of_clients):
    carnum = i + 1

    client = mqtt.Client()                 # クラスのインスタンス(実体)の作成
    client.on_connect = on_connect         # 接続時のコールバック関数を登録
    client.on_disconnect = on_disconnect   # 切断時のコールバックを登録
    client.on_publish = on_publish         # メッセージ送信時のコールバック

    client.connect("mqttbroker", 1883, 60)  # 接続先は自分自身

    # 通信処理スタート
    client.loop_start()    # subはloop_forever()だが，pubはloop_start()で起動だけさせる
    clientlist.append(client)


    #drivedata = pd.read_csv('/data/drivedata1.csv', parse_dates = [0], date_parser=date_parser)
    drivedata = pd.read_csv('/data/drivedata' + str(carnum) + '.csv')

    # timeフィールドを相対秒数に変換
    drivedata['time'] = [x - drivedata['time'][0] for x in drivedata['time']]
    drivedatalist.append(drivedata)

    threadlist.append(threading.Thread(target=run, args=(client, drivedata, carnum)))

  for i in range(num_of_clients):
    th = threadlist[i]
    th.start()
  
  #while True:
  # client.publish("DriveDemo","Hello, Drone!")    # トピック名とメッセージを決めて送信
  # sleep(3)   # 3秒待つ
