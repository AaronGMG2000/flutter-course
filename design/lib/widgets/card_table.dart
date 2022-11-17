import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(color: Colors.blue, icon: Icons.apps, text: 'General'),
            _SingleCard(
                color: Colors.purpleAccent,
                icon: Icons.emoji_transportation,
                text: 'Transport'),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
                color: Colors.blueAccent,
                icon: Icons.movie,
                text: 'Entertainment'),
            _SingleCard(
                color: Colors.blueGrey, icon: Icons.house, text: 'Grocery'),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
                color: Colors.purple,
                icon: Icons.shopping_bag,
                text: 'Transport'),
            _SingleCard(
                color: Colors.deepPurple,
                icon: Icons.emoji_transportation,
                text: 'Bill'),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
                color: Colors.purple,
                icon: Icons.shopping_bag,
                text: 'Transport'),
            _SingleCard(
                color: Colors.deepPurple,
                icon: Icons.emoji_transportation,
                text: 'Bill'),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const _SingleCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              color: Colors.white,
              size: 35,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(color: color, fontSize: 18),
          )
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
