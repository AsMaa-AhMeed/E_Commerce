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
  factory ProductRepoModel.fromJson(Map<String, dynamic> json) =>
      ProductRepoModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        listOfImages: List<String>.from(json["images"].map((x) => x)),
      );
}
