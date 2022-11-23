import 'package:dio/dio.dart';
import 'package:e/model/category_repo_model.dart';

class CategoryRepo {
  Future<List<CategoryRepoModel>> getAllCategories() async {
    final response =
        await Dio().get('https://api.escuelajs.co/api/v1/categories/');
    final List<CategoryRepoModel> listOfCategories =
        List<CategoryRepoModel>.from(response.data.map((element) {
      return CategoryRepoModel(
        id: element['id'],
        image: element['image'],
        name: element['name'],
      );
    }));
    return listOfCategories;
  }
}

// void main() {
//   CategoryRepo().getAllCategories();
// }
