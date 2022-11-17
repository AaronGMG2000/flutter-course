import 'package:design/pages/home_page.dart';
import 'package:design/pages/scroll_design_page.dart';
import 'package:flutter/material.dart';
import 'package:design/pages/basic_design_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Material App',
      initialRoute: "home_page",
      routes: {
        "basic_design": (_) => const BasicDesignPage(),
        "home_page": (_) => const HomePage(),
        "scroll_design": (_) => const ScrollDesignPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
