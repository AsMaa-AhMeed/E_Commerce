part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  List<CategoryRepoModel>? listOfCategories;
  CategorySuccess(this.listOfCategories);
}

class CategoryFailure extends CategoryState {
  final Exception? error;
  CategoryFailure(this.error);
}

class CategoryNotFound extends CategoryState {}

class CategoryNotInternetConnection extends CategoryState {}
