import 'package:flutter/material.dart';
import 'package:newsapp/pages/index.dart';
import 'package:newsapp/services/index.dart';
import 'package:newsapp/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: myTheme,
        home: const TabsPage(),
      ),
    );
  }
}
