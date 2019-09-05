車載器に記録されたデータをMQTTで送信し、Google Map上に位置情報をリアルタイムでプロットし、速度やエンジン回転数、加速度などの情報を表示するデモアプリケーションです。

このアプリケーションは、InterSystems IRIS Community Editionを利用しています。
使用許諾（https://github.com/mhoritaisj/DriveDemo/blob/master/EULA_IRIS_Community.pdf）をご確認ください。


#実行方法
1. 作業ディレクトリでファイル一式をpullします。

  > git init
  > git pull https://github.com/mhoritaisj/DriveDemo.git
  
2. Google Cloud Platform(GCP)の、Maps Javascript APIキーを取得し、WebServer/apikey.txt にテキストファイルとして保存します。
    （参考）GCP Webサイト： https://cloud.google.com/maps-platform/?apis=maps 
 
3. Dockerイメージをpull, buildし、コンテナを生成します。

  > ./rundemo.sh (Linux, MacOS)
  
  > rundemo.bat  (Windows)


4. Webページにアクセスします。

   http://localhost:49160
   
5. 車載器のデータを発生させます。

  > cd DataGenerator
  
  > ./run.sh  (Linux, MacOS)
  
  > run.bat  (Windows)
  
  最長約100分のデータがあります。途中で中止する場合は、Ctrl-Cを押してください。
  
