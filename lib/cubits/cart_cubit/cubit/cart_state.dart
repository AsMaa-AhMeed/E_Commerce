part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartCubitInitial extends CartState {}

abstract class CategoryState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartDataModel cartData;

  CartSuccess(this.cartData);
}

class CartFailure extends CartState {
  final Exception? error;
  CartFailure(this.error);
}

class CartNotFound extends CartState {}
