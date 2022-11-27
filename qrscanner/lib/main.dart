import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/pages/home_page.dart';
import 'package:qrscanner/pages/mapa_page.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';
import 'package:qrscanner/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        routes: {
          'home': (BuildContext context) => const HomePage(),
          'mapa': (BuildContext context) => const MapaPage(),
        },
      ),
    );
  }
}
