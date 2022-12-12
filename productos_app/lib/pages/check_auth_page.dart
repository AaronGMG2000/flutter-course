import 'package:flutter/material.dart';
import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

class CheckAuthPage extends StatelessWidget {
  const CheckAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: authService.readToken(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                changePage(context, const HomePage());
              } else {
                changePage(context, const LoginPage());
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  changePage(BuildContext context, Widget child) {
    Future.microtask(() {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => child,
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    });
  }
}
