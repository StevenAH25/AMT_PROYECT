import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async{

  }
  
  static Future<void> init() async{

    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("@mipmap/logo");

    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse ,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotificationResponse,
    );


    await flutterLocalNotificationsPlugin.
      resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.
      requestNotificationsPermission();

  

  }

  static Future<void> mostrarNotifiacion(String titulo, String body) async {
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails("channelId", "channelName", importance: Importance.high, priority: Priority.high)
      );

      await flutterLocalNotificationsPlugin.show(0, titulo, body, platformChannelSpecifics);
  }

  
}