import 'package:flutter/material.dart';

class BasicDesignPage extends StatelessWidget {
  const BasicDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(image: AssetImage('assets/images/landscape.jpeg')),
          const _Title(),
          const _ButtonSection(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: const Text(
                'Nostrud est irure non commodo duis magna labore cillum eiusmod cillum. Eiusmod labore aliqua minim amet ipsum. Enim irure id nostrud est aliqua consequat esse tempor proident adipisicing sint. Nisi consequat non sint sint non laboris minim et velit aliqua laborum culpa aliquip pariatur. Ipsum culpa et velit laboris consectetur commodo ex nostrud id. Lorem dolor consequat reprehenderit Lorem laborum pariatur aute adipisicing nisi in eiusmod deserunt labore tempor. Occaecat laboris mollit ea proident laboris elit in. Lorem consequat proident ullamco aliqua aliqua exercitation consequat velit ipsum tempor consequat. Aute ut exercitation dolor aliquip magna est minim excepteur exercitation exercitation magna dolor. Quis dolor minim ipsum reprehenderit ea aliqua est cupidatat tempor. Eu commodo sint mollit est do occaecat duis.'),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Oeschinen Lake Campgground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.red),
          const Text('41'),
        ],
      ),
    );
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _ButtonIcon(icon: Icons.phone, text: 'CALL'),
          _ButtonIcon(icon: Icons.near_me, text: 'ROUTE'),
          _ButtonIcon(icon: Icons.share, text: 'SHARE')
        ],
      ),
    );
  }
}

class _ButtonIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ButtonIcon({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 30),
        const SizedBox(height: 5),
        Text(text, style: const TextStyle(color: Colors.blue, fontSize: 15)),
      ],
    );
  }
}
