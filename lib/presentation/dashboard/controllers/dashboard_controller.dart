import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/presentation/account/views/account_view.dart';
import 'package:soc_grocery/presentation/cart/controllers/cart_controller.dart';
import 'package:soc_grocery/presentation/cart/views/cart_view.dart';
import 'package:soc_grocery/presentation/explore/views/explore_view.dart';
import 'package:soc_grocery/presentation/favourite/views/favourite_view.dart';
import 'package:soc_grocery/presentation/shop/views/shop_view.dart';

class DashboardController extends GetxController {

  Rx<int> currentTab = Rx<int>(0);
  List<Widget> listTab = [
    const ShopView(),
    const ExploreView(),
    const CartView(),
    const FavouriteView(),
    const AccountView()
  ];

  @override
  void onInit() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await FirebaseMessagingHandler.handle(message);
    });

    FirebaseMessaging.onBackgroundMessage((message) async {
      await FirebaseMessagingHandler.handle(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      await FirebaseMessagingHandler.handle(message);
    });

    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    super.onInit();
  }

  void _handleMessage(RemoteMessage message) {
    log(message.data.toString());
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTab({required int index}){
    currentTab.value = index;
  }
}

class FirebaseMessagingHandler {
  static Future<void> handle(RemoteMessage message) async {
    print('Got a message with title: ${message.notification!.title}');

    FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();
    var androidSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var settings = InitializationSettings(android: androidSettings);

    await notifications.initialize(settings);

    var androidDetails = const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      showWhen: true,
    );
    var notificationDetails = NotificationDetails(android: androidDetails);

    await notifications.show(
      0,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
      payload: message.data['payload'],
    );
  }

  static Future<void> show({required String title, required content}) async {

    FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();
    var androidSettings = const AndroidInitializationSettings(
        '@mipmap/ic_launcher');
    var settings = InitializationSettings(android: androidSettings);

    await notifications.initialize(settings);

    var androidDetails = const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      showWhen: true,
    );
    var notificationDetails = NotificationDetails(android: androidDetails);

    await notifications.show(
      0,
      title,
      content,
      notificationDetails,
      // payload: message.data['payload'],
    );
  }
}
