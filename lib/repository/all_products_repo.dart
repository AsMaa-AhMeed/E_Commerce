import 'package:dio/dio.dart';
import 'package:e/model/product_repo_model.dart';

class ProductRepository {
  Future<List<ProductRepoModel>> getAllProducts() async {
    // fetch / get data
    final response = await Dio().get('https://dummyjson.com/products');

    // modelling
    final listOfProductModel =
        List<ProductRepoModel>.from(response.data['products'].map((element) {
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

  Future<ProductRepoModel> getSingleProduct(int productId) async {
    final response =
        await Dio().get('https://dummyjson.com/products/$productId');

    final singleProduct = ProductRepoModel.fromJson(response.data);

    return singleProduct;
  }
  // Future<ProductRepoModel> getSingleProduct(int productId) async {
  //   final response =
  //       await Dio().get('https://dummyjson.com/products/$productId');

  //   final product = ProductRepoModel(
  //     discountPercentage: response.data['discountPercentage'],
  //     id: response.data['id'],
  //     title: response.data['title'],
  //     price: response.data['price'],
  //     category: response.data['category'],
  //     description: response.data['description'],
  //     //  listOfImages:response.data['images'],
  //     listOfImages: [],
  //     brand: response.data['brand'],
  //     rating: response.data['rating'],
  //     stock: response.data['stock'],
  //     thumbnail: response.data['thumbnail'],
  //   );

  //   return product;
  // }
}
