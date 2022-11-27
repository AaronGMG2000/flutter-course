import 'package:flutter/material.dart';
import 'package:preferences/providers/theme_provider.dart';
import 'package:preferences/shared/preferences.dart';
import 'package:preferences/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = 'Settings';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                SwitchListTile.adaptive(
                  value: Preferences.getBool('isDarkMode'),
                  onChanged: (value) {
                    setState(() =>
                        Provider.of<ThemeProvider>(context, listen: false)
                            .setTheme(value));
                  },
                  title: const Text('Dark Mode'),
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 0,
                  groupValue: Preferences.getInt('gender') ?? 0,
                  onChanged: (value) {
                    setState(() => Preferences.setInt('gender', value));
                  },
                  title: const Text('Masculino'),
                ),
                RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.getInt('gender') ?? 0,
                  onChanged: (value) {
                    setState(() => Preferences.setInt('gender', value));
                  },
                  title: const Text('Femenino'),
                ),
                const Divider(),
                TextFormField(
                  initialValue: Preferences.getString('name'),
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el teléfono',
                  ),
                  onChanged: (value) {
                    setState(() => Preferences.setString('name', value));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
