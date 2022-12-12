import 'dart:convert';

class Product {
  String? picture;
  String? id;
  bool available;
  String name;
  double price;
  Product({
    this.picture,
    required this.available,
    required this.name,
    required this.price,
    this.id,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        picture: json["picture"],
        available: json["available"],
        name: json["name"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "picture": picture,
        "available": available,
        "name": name,
        "price": price,
      };

  Product copy() => Product(
        picture: picture,
        available: available,
        name: name,
        price: price,
        id: id,
      );
}
