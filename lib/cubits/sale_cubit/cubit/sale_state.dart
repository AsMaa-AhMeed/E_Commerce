part of 'sale_cubit.dart';

@immutable
abstract class SaleSectionState {}

class SaleSectionInitial extends SaleSectionState {}

class SaleSectionSuccess extends SaleSectionState {
  final List<FlashSaleRepoModel> flashSaleRepoModel;
  SaleSectionSuccess(this.flashSaleRepoModel);
}

class SaleSectionFailure extends SaleSectionState {}

class SaleSectionLoading extends SaleSectionState {}

class SaleSectionNotInternetConnection extends SaleSectionState {}
