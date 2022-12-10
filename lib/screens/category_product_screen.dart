import 'package:e/model/product_repo_model.dart';
import 'package:e/repository/product_repo.dart';
import 'package:e/shared/shared_widgets/category_product_widget.dart';
import 'package:flutter/material.dart';

class CategoryProductScreen extends StatelessWidget {
  final String categoryName;
  const CategoryProductScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          categoryName,
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<ProductRepoModel>>(
          future: ProductRepo().getAllProducts(categoryName),
          builder: (context, snapshot) {
            final listOfProduct = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                  height: 100,
                  child: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ProductCategoryWidget(listOfProduct: listOfProduct!);
            }
            return const Text('Page Loading');
          }),
    );
  }
}
