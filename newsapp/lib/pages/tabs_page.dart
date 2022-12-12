import 'package:flutter/material.dart';
import 'package:newsapp/models/index.dart';
import 'package:newsapp/pages/index.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationModel()),
      ],
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<NavigationModel>(context);
    return BottomNavigationBar(
      currentIndex: navigationModel.actualPage,
      onTap: (index) => navigationModel.actualPage = index,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
        BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions), label: 'Suscripciones'),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: Provider.of<NavigationModel>(context).pageController,
      children: const [
        Tab1Page(),
        Tab2Page(),
        Center(child: Text('Page 3')),
      ],
    );
  }
}
