import 'package:dio/dio.dart';
import 'package:e/model/flash_sale_repo_model.dart';

class FlashSaleRepo {
  Future<List<FlashSaleRepoModel>> getAllFlashSale() async {
    final response =
        await Dio().get('https://dummyjson.com/products/category/smartphones');
    final listOfFlashSaleModel =
        List<FlashSaleRepoModel>.from(response.data['products'].map((value) {
      return FlashSaleRepoModel(
        id: value['id'],
        price: value['price'],
        title: value['title'],
        category: value['category'],
        discountPercentage: value['discountPercentage'],
        description: value['description'],
        //listOfImages: value['images'],
        listOfImages: [],
        brand: value['brand'],
        rating: value['rating'],
        stock: value['stock'],
        thumbnail: value['thumbnail'],
      );
    }));
    return listOfFlashSaleModel;
  }
}
