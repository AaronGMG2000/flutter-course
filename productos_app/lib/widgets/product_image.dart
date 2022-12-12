import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductImage extends StatelessWidget {
  final Product product;
  const ProductImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: _boxDecoration(),
        child: Opacity(
          opacity: 0.85,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: getImage(product.picture),
          ),
        ),
      ),
    );
  }

  Widget getImage(String? picture) {
    if (picture == null || picture.isEmpty) {
      return const Image(
        image: AssetImage(
          'assets/no-image.png',
        ),
        fit: BoxFit.cover,
      );
    }
    if (picture.startsWith('http')) {
      return FadeInImage(
        image: NetworkImage(product.picture!),
        placeholder: const AssetImage('assets/jar-loading.gif'),
        fit: BoxFit.cover,
      );
    }
    return Image.file(
      File(picture),
      fit: BoxFit.cover,
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      );
}
