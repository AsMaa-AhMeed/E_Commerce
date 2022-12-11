import 'package:e/model/flash_sale_repo_model.dart';
import 'package:e/repository/flash_sale_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sale_state.dart';

class SaleCubit extends Cubit<SaleSectionState> {
  SaleCubit() : super(SaleSectionInitial());
  void getAllFlashSale() async {
    try {
      emit(SaleSectionLoading());
      List<FlashSaleRepoModel> flashSaleRepoModel =
          await FlashSaleRepo().getAllFlashSale();

      emit(SaleSectionSuccess(flashSaleRepoModel));
    } on Exception catch (exception) {
      emit(SaleSectionFailure());
    }
  }
}
