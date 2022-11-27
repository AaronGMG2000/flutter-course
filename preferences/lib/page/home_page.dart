import 'package:flutter/material.dart';
import 'package:preferences/shared/preferences.dart';
import 'package:preferences/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'Home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkMode: ${Preferences.getBool('isDarkMode')}'),
          const Divider(),
          Text(
              'Género: ${Preferences.getInt('gender') == 0 ? 'Masculino' : 'Femenino'}'),
          const Divider(),
          Text('Nombre de usuario: ${Preferences.getString('name')}'),
        ],
      ),
    );
  }
}
