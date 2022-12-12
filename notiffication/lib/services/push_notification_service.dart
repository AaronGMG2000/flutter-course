import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStreamController =
      StreamController<String>.broadcast();
  static Stream<String> get messagesStream => _messageStreamController.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    _messageStreamController.add(message.data['product'] ?? '');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    _messageStreamController.add(message.data['product'] ?? '');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    _messageStreamController.add(message.data['product'] ?? '');
  }

  static Future initializeApp() async {
    token = await FirebaseMessaging.instance.getToken();
    debugPrint('token: $token');
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}
