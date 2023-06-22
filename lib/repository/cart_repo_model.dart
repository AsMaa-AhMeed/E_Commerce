import 'package:dio/dio.dart';
import 'package:e/model/cart_model.dart';

class CartRepoModel {
  Future<CartDataModel> getCartData() async {
    final response = await Dio().get('https://dummyjson.com/carts/1');
    final cartData = CartDataModel.fromJson(response.data);
    return cartData;
  }
}
