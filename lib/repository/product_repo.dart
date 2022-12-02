import 'package:dio/dio.dart';
import 'package:e/model/product_repo_model.dart';

class ProductRepo {
  Future<List<ProductRepoModel>> getAllProducts() async {
    final respone = await Dio().get('https://dummyjson.com/products');
    final listOfProductModel =
        List<ProductRepoModel>.from(respone.data['products'].map((element) {
      return ProductRepoModel(
        discountPercentage: element['discountPercentage'],
        id: element['id'],
        title: element['title'],
        price: element['price'],
        category: element['category'],
        description: element['description'],
        //  listOfImages: element['images'],
        listOfImages: [],
        brand: element['brand'],
        rating: element['rating'],
        stock: element['stock'],
        thumbnail: element['thumbnail'],
      );
    }));
    return listOfProductModel;
  }
}