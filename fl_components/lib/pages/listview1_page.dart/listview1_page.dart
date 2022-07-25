import 'package:flutter/material.dart';

class Listview1Page extends StatelessWidget {
  const Listview1Page({Key? key}) : super(key: key);
  final options = const [
    'Megaman',
    'Megaman 2',
    'Megaman 3',
    'Megaman 4',
    'Megaman 5',
    'Metal Slug',
    'Final Fantasy'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Tipo 1'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          onTap: () {},
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        separatorBuilder: (_, __) => const Divider(height: 5),
      ),
    );
  }
}
