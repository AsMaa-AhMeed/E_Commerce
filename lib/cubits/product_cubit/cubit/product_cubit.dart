import 'package:e/model/product_repo_model.dart';
import 'package:e/repository/all_products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  void getAllProducts() async {
    try {
      emit(ProductLoading());
      final List<ProductRepoModel> listOfProduct =
          await ProductRepository().getAllProducts();

      emit(ProductSuccess(listOfProduct));
    } on Exception catch (exception) {
      emit(ProductFailure(exception));
    }
  }
}
