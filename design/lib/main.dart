import 'package:design/pages/scroll_design_page.dart';
import 'package:flutter/material.dart';
import 'package:design/pages/basic_design_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: "scroll_design",
      routes: {
        "basic_design": (_) => const BasicDesignPage(),
        "scroll_design": (_) => const ScrollDesignPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
