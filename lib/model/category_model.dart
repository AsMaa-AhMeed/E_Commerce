class CategoryModel {
  String image;
  String title;
  String? newPrice;
  String? oldPrice;
  CategoryModel(
      {required this.image, required this.title, this.newPrice, this.oldPrice});
}
