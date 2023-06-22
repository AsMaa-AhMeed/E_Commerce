import 'package:e/model/product_repo_model.dart';
import 'package:e/repository/all_products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'single_product_state.dart';

class SingleProductCubit extends Cubit<SingleProductState> {
  SingleProductCubit() : super(SingleProductInitial());
  void getSingleProduct(int productId) async {
    try {
      emit(SingleProductLoading());
      final ProductRepoModel productData =
          await ProductRepository().getSingleProduct(productId);

      emit(SingleProductSuccess(productData));
    } on Exception catch (exception) {
      emit(SingleProductFailure(exception));
    }
  }
}
