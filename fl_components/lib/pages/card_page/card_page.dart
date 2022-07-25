import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl:
                'https://media.macphun.com/img/uploads/customer/blog/504/15360610675b8e6e8b52bd36.49629027.jpg?q=85&w=1680',
            title: 'Card Title',
          ),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl:
                'https://blog.nzibs.co.nz/wp-content/uploads/2020/02/Landscape-1280x640.jpg',
          ),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl:
                'https://lp-cms-production.imgix.net/features/2016/02/GettyRF_533946197.jpg',
          ),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl:
                'https://photographylife.com/wp-content/uploads/2016/06/Mass.jpg',
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
