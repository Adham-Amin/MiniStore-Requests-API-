import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Core/models/product_model/product_model/product_model.dart';
import 'package:mini_store/Features/home/data/home_repo.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit(this._homeRepo) : super(AllProductInitial());
  final HomeRepo _homeRepo;
  Future<void> getAllProducts() async {
    emit(AllProductLoading());
    var result = await _homeRepo.getAllProducts();
    result.fold(
      (failure) => emit(
        AllProductFailure(failure.message),
      ),
      (products) => emit(
        AllProductLoaded(products),
      ),
    );
  }
}
