part of 'single_product_cubit.dart';

abstract class SingleProductState {}

class SingleProductInitial extends SingleProductState {}

class SingleProductLoading extends SingleProductState {}

class SingleProductSuccess extends SingleProductState {
  final ProductRepoModel productModel;
  SingleProductSuccess(this.productModel);
}

class SingleProductFailure extends SingleProductState {
  final Exception? error;
  SingleProductFailure(this.error);
}
