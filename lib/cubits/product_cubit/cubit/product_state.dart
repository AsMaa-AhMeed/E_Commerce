part of 'product_cubit.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  List<ProductRepoModel>? listOfProduct;
  ProductSuccess(this.listOfProduct);
}

class ProductFailure extends ProductState {
  final Exception? error;
  ProductFailure(this.error);
}

class ProductNotFound extends ProductState {}

class ProductNotInternetConnection extends ProductState {}
