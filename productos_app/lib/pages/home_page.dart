import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    if (productService.isLoading) return const LoadingPage();
    List<Product> products = productService.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        leading: IconButton(
            onPressed: () async {
              await authService.logout();
              if (!context.mounted) return;
              Navigator.of(context).pushReplacementNamed('Login');
            },
            icon: const Icon(Icons.exit_to_app)),
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                productService.selectedProduct = products[index].copy();
                Navigator.of(context).pushNamed('Product');
              },
              child: ProductCard(product: products[index]))),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            productService.selectedProduct =
                Product(available: true, name: '', price: 0);
            Navigator.of(context).pushNamed('Product');
          }),
    );
  }
}
