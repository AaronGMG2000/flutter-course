import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text("Soy un titulo"),
            leading: Icon(Icons.photo_album_outlined, color: AppTheme.primary),
            subtitle: const Text(
                "Ut laborum cillum occaecat velit irure esse laborum aliquip reprehenderit sunt tempor amet eu enim. Ut ex quis amet incididunt nisi minim nisi eu. Incididunt minim id dolor aute esse nisi elit incididunt ipsum. Aliquip duis nostrud consequat laboris deserunt veniam non aute aliqua. Anim occaecat proident ipsum ut nulla. Commodo ea dolore ullamco et est laborum cupidatat consequat minim."),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: const Text("cancel")),
                TextButton(onPressed: () {}, child: const Text("ok"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
