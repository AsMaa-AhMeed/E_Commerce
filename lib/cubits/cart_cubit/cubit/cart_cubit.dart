import 'package:bloc/bloc.dart';
import 'package:e/model/cart_model.dart';
import 'package:e/repository/cart_repo_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartCubitInitial());
  void getCartData() async {
    try {
      emit(CartLoading());
      final CartDataModel cartData = await CartRepoModel().getCartData();
      emit(CartSuccess(cartData));
    } on Exception catch (exception) {
      emit(CartFailure(exception));
    }
  }
}
