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
