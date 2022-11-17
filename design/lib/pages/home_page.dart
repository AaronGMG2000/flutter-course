import 'package:design/widgets/backgroud.dart';
import 'package:design/widgets/body_title.dart';
import 'package:design/widgets/card_table.dart';
import 'package:design/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      body: Center(
        child: Stack(
          children: const [Backgroud(), _HomeBody()],
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: const [
          BodyTitle(),
          CardTable(),
        ],
      ),
    );
  }
}
