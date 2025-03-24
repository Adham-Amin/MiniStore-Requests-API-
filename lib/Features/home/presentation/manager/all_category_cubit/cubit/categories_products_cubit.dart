import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Core/models/product_model/product_model/product_model.dart';
import 'package:mini_store/Features/home/data/home_repo.dart';

part 'categories_products_state.dart';

class CategoriesProductsCubit extends Cubit<CategoriesProductsState> {
  CategoriesProductsCubit(this._homeRepo) : super(CategoriesProductsInitial());
  final HomeRepo _homeRepo;
  Future<void> getCategoriesProducts({required String category}) async {
    emit(CategoriesProductsLoading());
    var result = await _homeRepo.getCategoriesProducts(category: category);
    result.fold(
      (failure) => emit(CategoriesProductsFailure(errorMessage: failure.message)),
      (products) => emit(CategoriesProductsLoaded(products: products)),
    );
  }
}
