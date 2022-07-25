import 'package:fl_components/models/models.dart';
import 'package:flutter/material.dart';
import 'package:fl_components/pages/pages.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listview1',
        icon: Icons.list,
        name: 'ListView Page',
        screen: const Listview1Page()),
    MenuOption(
        route: 'card',
        icon: Icons.card_giftcard,
        name: 'Cards Page',
        screen: const CardPage()),
    MenuOption(
        route: 'alert',
        icon: Icons.message,
        name: 'Alerts Page',
        screen: const AlertPage()),
    MenuOption(
        route: 'avatar',
        icon: Icons.supervised_user_circle,
        name: 'Circle Avatar',
        screen: const AvatarPage()),
    MenuOption(
        route: 'animated',
        icon: Icons.animation,
        name: 'Animated Container',
        screen: const AnimatedPage()),
    MenuOption(
        route: 'inputs',
        icon: Icons.input_rounded,
        name: 'Text inputs',
        screen: const InputsPage()),
    MenuOption(
        route: 'slider',
        icon: Icons.slow_motion_video,
        name: 'Slider an Cheks',
        screen: const SliderPage()),
    MenuOption(
        route: 'listviewbuilder',
        icon: Icons.build_circle_outlined,
        name: 'InfiniteScroll & PUll to refresh',
        screen: const ListviewBuilderPage()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    routes.addAll({'home': (BuildContext context) => const HomePage()});
    for (MenuOption option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return routes;
  }

  static Route<dynamic> onGenerateRoute(settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertPage(),
    );
  }
}
