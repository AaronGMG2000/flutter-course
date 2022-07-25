import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? title;
  const CustomCardType2({
    Key? key,
    required this.imageUrl,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: AppTheme.primary.withOpacity(0.5),
      elevation: 10,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            width: double.infinity,
            height: 280,
            fit: BoxFit.cover,
          ),
          if (title != null)
            Container(
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              alignment: AlignmentDirectional.centerEnd,
              child: Text(title!),
            )
        ],
      ),
    );
  }
}
