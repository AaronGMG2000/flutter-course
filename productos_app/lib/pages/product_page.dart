import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/product_service.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final product = productService.selectedProduct;
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(product),
      child: _ProductPageBody(product: product),
    );
  }
}

class _ProductPageBody extends StatelessWidget {
  const _ProductPageBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final productService = Provider.of<ProductService>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: productService.isSaving
            ? null
            : () async {
                if (productForm.isValidForm()) {
                  final String? imageUrl = await productService.uploadImage();
                  if (imageUrl != null) productForm.product.picture = imageUrl;
                  productService.saveOrCreateProduct(productForm.product);
                }
              },
        child: productService.isSaving
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white))
            : const Icon(Icons.save_outlined),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(product: product),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      productService.newPictureFile = null;
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                          source: ImageSource.camera, imageQuality: 100);
                      if (pickedFile != null) {
                        productService
                            .updateSelectedProductImage(pickedFile.path);
                      }
                    },
                    icon: const Icon(Icons.camera_alt_outlined),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const _ProductForm(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
            key: productForm.formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                    initialValue: product.name,
                    onChanged: (value) => product.name = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El nombre es obligatorio';
                      }
                      return null;
                    },
                    decoration: InputDecorations.authInputDecoration(
                        hintText: 'Nombre del Producto', labelText: 'Nombre:')),
                const SizedBox(height: 30),
                TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    initialValue: '${product.price}',
                    onChanged: (value) {
                      if (double.tryParse(value) == null) {
                        product.price = 0;
                      } else {
                        product.price = double.parse(value);
                      }
                    },
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: false, decimal: true),
                    decoration: InputDecorations.authInputDecoration(
                        hintText: '\$150', labelText: 'Precio:')),
                const SizedBox(height: 30),
                SwitchListTile.adaptive(
                  value: product.available,
                  onChanged: productForm.updateAvailable,
                  title: const Text('Disponible'),
                  activeColor: Colors.indigo,
                ),
                const SizedBox(height: 30),
              ],
            )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0, 7),
          blurRadius: 10,
        )
      ],
    );
  }
}
