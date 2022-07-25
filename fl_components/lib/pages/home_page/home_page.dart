import 'package:fl_components/routes/app_routes.dart';
import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Componentes en Flutter'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(AppRoutes.menuOptions[index].name),
            leading: Icon(
              AppRoutes.menuOptions[index].icon,
              color: AppTheme.primary,
            ),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.menuOptions[index].route);
            },
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: AppRoutes.menuOptions.length,
        ));
  }
}
