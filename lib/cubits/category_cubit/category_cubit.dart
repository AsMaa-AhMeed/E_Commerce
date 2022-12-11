import 'package:e/model/category_repo_model.dart';
import 'package:e/repository/category_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void getAllCategories() async {
    try {
      emit(CategoryLoading());
      final List<CategoryRepoModel> listOfCategories =
          await CategoryRepo().getAllCategories();

      emit(CategorySuccess(listOfCategories));
    } on Exception catch (exception) {
      emit(CategoryFailure(exception));
    }
  }
}
