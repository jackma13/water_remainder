// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:water_remainder/globle_var.dart';

class localnotificationservice {
  localnotificationservice();
  final _localnotificationservice = FlutterLocalNotificationsPlugin();
  final BehaviorSubject<String?> onnotificationclicked = BehaviorSubject();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings settings =
        InitializationSettings(android: androidInitializationSettings);
    await _localnotificationservice.initialize(settings,
        onSelectNotification: onselectnotification);
  }

  Future<NotificationDetails> _notificationdetails() async {
    const AndroidNotificationDetails androidnotificationdetails =
        AndroidNotificationDetails('channelId', 'channelName',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true);
    return const NotificationDetails(android: androidnotificationdetails);
  }

  Future<void> quizenotification({
    int id = 0,
  }) async {
    final details = await _notificationdetails();
    await _localnotificationservice.zonedSchedule(
        id,
        "Your body needs water!",
        "Do not forget to drink water",
        tz.TZDateTime.from(
          DateTime.now().add(Duration(minutes: databox.get("notifiaction"))),
          tz.local,
        ),
        details,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void onselectnotification(String? payload) {
    print('payload $payload');
    if (payload != null && payload.isNotEmpty) {
      onnotificationclicked.add(payload);
    }
  }
}
