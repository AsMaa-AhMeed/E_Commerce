class ProductRepoModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final dynamic rating;
  final int stock;
  final String brand;
  final String thumbnail;
  final String category;
  final List<String> listOfImages;

  ProductRepoModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.discountPercentage,
    required this.description,
    required this.listOfImages,
    required this.brand,
    required this.rating,
    required this.stock,
    required this.thumbnail,
  });
}
// To parse this JSON data, do
//
//     final productsData = productsDataFromJson(jsonString);

// import 'dart:convert';

// ProductsData productsDataFromJson(String str) =>
//     ProductsData.fromJson(json.decode(str));

// String productsDataToJson(ProductsData data) => json.encode(data.toJson());

// class ProductsData {
//   ProductsData({
//     required this.products,
//     required this.total,
//     required this.skip,
//     required this.limit,
//   });

//   List<Product> products;
//   int total;
//   int skip;
//   int limit;

//   factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
//         products: List<Product>.from(
//             json["products"].map((x) => Product.fromJson(x))),
//         total: json["total"],
//         skip: json["skip"],
//         limit: json["limit"],
//       );

//   Map<String, dynamic> toJson() => {
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//         "total": total,
//         "skip": skip,
//         "limit": limit,
//       };
// }

// class Product {
//   Product({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.discountPercentage,
//     required this.rating,
//     required this.stock,
//     required this.brand,
//     required this.category,
//     required this.thumbnail,
//     required this.images,
//   });

//   int id;
//   String title;
//   String description;
//   int price;
//   double discountPercentage;
//   double rating;
//   int stock;
//   String brand;
//   String category;
//   String thumbnail;
//   List<String> images;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         price: json["price"],
//         discountPercentage: json["discountPercentage"].toDouble(),
//         rating: json["rating"].toDouble(),
//         stock: json["stock"],
//         brand: json["brand"],
//         category: json["category"],
//         thumbnail: json["thumbnail"],
//         images: List<String>.from(json["images"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "price": price,
//         "discountPercentage": discountPercentage,
//         "rating": rating,
//         "stock": stock,
//         "brand": brand,
//         "category": category,
//         "thumbnail": thumbnail,
//         "images": List<dynamic>.from(images.map((x) => x)),
//       };
// }
