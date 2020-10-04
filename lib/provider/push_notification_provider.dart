import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  initNotification() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((value) => print('token : ' + value));

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(initSettings);

    _firebaseMessaging.configure(onMessage: (data) {
      print('on Message');
      var notificationData = data['notification'];
       var title = notificationData['title'];
       var body = notificationData['body'];


      print(data['notification']);


      var android = new AndroidNotificationDetails('channelId', 'channelName', 'channelDescription');
      var ios = new IOSNotificationDetails();
      var platform =  new NotificationDetails(android, ios);
      flutterLocalNotificationsPlugin.show(0, title, body, platform);


    }, onLaunch: (data) {
      print(' onLaunch');
      print(data);
    }, onResume: (data) {
      print('onResume');
      print(data);
    });
  }
}
