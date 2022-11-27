import 'package:flutter/material.dart';
import 'package:preferences/page/page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          listTile('Home', Icons.home, HomePage.routeName, context),
          listTile('Settings', Icons.settings, SettingsPage.routeName, context),
        ],
      ),
    );
  }

  Widget listTile(
      String title, IconData icon, String routeName, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pushReplacementNamed(context, routeName);
      },
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/menu-img.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
