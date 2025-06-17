import 'package:almubarok_present/controllers/leave_controller.dart';
import 'package:almubarok_present/main.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:almubarok_present/services/api/auth_service.dart';
import 'package:almubarok_present/utils/date_format_converter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart' hide FormData;

class NavTabController extends GetxController {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

  RxBool isLoading = false.obs;
  RxInt tabIndex = 0.obs;

  @override
  void onInit() {
    registerToken();
    setupNotificationHandlers();
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void setupNotificationHandlers() {
    // Handle notification tap when app is terminated
    firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        handleNotificationTap(message);
      }
    });

    // Handle notification tap when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleNotificationTap(message);
    });
  }

  Future<void> registerToken() async {
    isLoading.value = true;
    try {
      await firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      firebaseMessaging.getToken().then(
        (token) async {
          final FormData formData = FormData.fromMap({'fcm_token': token});
          await AuthService.registerFCMToken(
            formData: formData,
          );
        },
      );

      FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) async {
          if (message.notification != null) {
            const AndroidNotificationDetails androidPlatformChannelSpecifics =
                AndroidNotificationDetails(
              'jco_unggul',
              'unggul',
              importance: Importance.high,
              priority: Priority.high,
              channelShowBadge: true,
              enableVibration: true,
              playSound: true,
            );

            NotificationDetails platformChannelSpecifics =
                const NotificationDetails(
                    android: androidPlatformChannelSpecifics);

            await flutterLocalNotificationsPlugin.show(
              DateTime.now().millisecond,
              message.notification!.title,
              message.notification!.body,
              platformChannelSpecifics,
              payload:
                  '${message.data['id']}||${message.data['type']}', // Include type in payload
            );
          }
          await handleBackgroundMessage(message);
        },
      );

      // Setup notification tap handler for foreground notifications
      flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        ),
        onDidReceiveNotificationResponse: (NotificationResponse details) {
          if (details.payload != null) {
            handleLocalNotificationTap(details.payload!);
          }
        },
      );
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      debugPrint('StackTrace: $stackTrace');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> handleNotificationTap(RemoteMessage message) async {
    try {
      final data = message.data;
      final String? id = data['id'];
      final String? type = data['type'];

      if (id != null && type != null) {
        navigateToSpecificPage(id, type);
      }
    } catch (e) {
      debugPrint('Error handling notification tap: $e');
    }
  }

  Future<void> handleLocalNotificationTap(String payload) async {
    try {
      final parts = payload.split('||');
      if (parts.length == 2) {
        final String id = parts[0];
        final String type = parts[1];

        navigateToSpecificPage(id, type);
      }
    } catch (e) {
      debugPrint('Error handling local notification tap: $e');
    }
  }

  void navigateToSpecificPage(String id, String type) async {
    try {
      final int parsedId = int.parse(id);
      final String lowerType = type.toLowerCase();

      // JCO Approval
      if (lowerType == 'leave') {
        final controller = Get.find<LeaveController>();
        await controller.getLeaveDetail(id: parsedId);
        final data = controller.leaveResponseModelDetail.data?[0];
        Get.toNamed(
          PageName.leaveDetail,
          arguments: {
            'day': DateFormatConverter.convertDayFormat(data?.date),
            'date': DateFormatConverter.convertDateFormat(data?.date),
            'status': data?.status ?? '-',
            'reason': data?.reason ?? '-',
            'note': data?.note ?? '-',
          },
        );
      }
      // Unknown Notification
      else {
        debugPrint('Unknown notification type: $type');
      }
    } catch (e) {
      debugPrint('Error navigating to page: $e');
    }
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    debugPrint('Title: ${message.notification?.title}');
    debugPrint('Body: ${message.notification?.body}');
  }
}
