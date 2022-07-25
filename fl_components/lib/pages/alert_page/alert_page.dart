import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Alert Dialog'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Esto es un dialogo'),
            SizedBox(height: 10),
            FlutterLogo(size: 100),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar')),
        ],
      ),
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        title: const Text('Alert Dialog'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Esto es un dialogo'),
            SizedBox(height: 10),
            FlutterLogo(size: 100),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Platform.isAndroid
              ? displayDialogAndroid(context)
              : displayDialogIOS(context),
          child: const Text('Mostrar alerta'),
        ),
      ),
    );
  }
}
