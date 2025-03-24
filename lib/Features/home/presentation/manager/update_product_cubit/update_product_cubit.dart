import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Core/models/product_model/product_model/product_model.dart';
import 'package:mini_store/Features/home/data/home_repo.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit(this._homeRepo) : super(UpdateProductInitial());

  final HomeRepo _homeRepo;

  Future<void> updateProduct({
    required String id,
    required String title,
    required double price,
    required String description,
    required String image,
  }) async {
    emit(UpdateProductLoading());
    var result = await _homeRepo.updateProducts(
      id: id,
      title: title,
      price: price,
      description: description,
      image: image,
    );
    result.fold(
      (failure) => emit(UpdateProductFailure(message: failure.message)),
      (product) => emit(UpdateProductLoaded(product: product)),
    );
  }
}
