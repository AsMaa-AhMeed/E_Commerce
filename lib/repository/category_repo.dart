import 'package:dio/dio.dart';
import 'package:e/model/category_repo_model.dart';

class CategoryRepo {
  Future<List<CategoryRepoModel>> getAllCategories() async {
    final response = await Dio()
        .get('https://mocki.io/v1/e5775744-06ba-4306-b6f6-93055de3c2d5');
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
