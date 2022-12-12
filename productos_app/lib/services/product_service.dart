import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:productos_app/models/product.dart';
import 'package:productos_app/utils/urls.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final List<Product> products = [];
  bool isLoading = true;
  bool isSaving = false;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  File? newPictureFile;
  late Product selectedProduct;
  ProductService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(Urls.baseURL, 'products.json',
        {'auth': await storage.read(key: 'token')});
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });
    isLoading = false;
    notifyListeners();
    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();
    if (product.id == null) {
      await createProduct(product);
    } else {
      await updateProduct(product);
    }
    isSaving = false;
    notifyListeners();
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(Urls.baseURL, 'products.json',
        {'auth': await storage.read(key: 'token')});
    final resp = await http.post(url, body: product.toJson());
    final decodedData = json.decode(resp.body);
    product.id = decodedData['name'];
    products.add(product);
    return product.id!;
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(Urls.baseURL, 'products/${product.id}.json',
        {'auth': await storage.read(key: 'token')});
    final resp = await http.put(url, body: product.toJson());
    final decodedData = json.decode(resp.body);
    debugPrint(decodedData.toString());
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;
    return product.id!;
  }

  void updateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;
    isSaving = true;
    notifyListeners();
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dhnkxspqi/image/upload?upload_preset=ipf84usa');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      debugPrint('Something went wrong');
      debugPrint(resp.body);
      return '';
    }
    final respData = json.decode(resp.body);
    debugPrint(respData.toString());
    newPictureFile = null;
    isSaving = false;
    notifyListeners();
    return respData['secure_url'];
  }
}
