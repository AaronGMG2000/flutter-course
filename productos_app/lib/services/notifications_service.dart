import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 20)),
      duration: const Duration(milliseconds: 1500),
    );
    messengerKey.currentState!.showSnackBar(snackbar);
  }
}
