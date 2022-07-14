import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _count = 0;

  void increase() {
    setState(() {
      _count++;
    });
  }

  void decrease() {
    setState(() {
      _count--;
    });
  }

  void reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle fontSize30 = TextStyle(
      fontSize: 30,
    );
    return Scaffold(
      appBar: AppBar(title: const Text("Hola Mundo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Número de Clicks", style: fontSize30),
            Text("$_count", style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
        decrease: decrease,
        increase: increase,
        reset: reset,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increase;
  final Function decrease;
  final Function reset;
  const CustomFloatingActions({
    Key? key,
    required this.increase,
    required this.decrease,
    required this.reset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => increase(),
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => reset(),
          child: const Icon(Icons.restore),
        ),
        FloatingActionButton(
          onPressed: () => decrease(),
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
