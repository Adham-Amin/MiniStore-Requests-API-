import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Features/home/data/home_repo.dart';

part 'categories_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit(this._homeRepo) : super(AllCategoriesInitial());

  final HomeRepo _homeRepo;
  Future<void> getCategories() async {
    emit(AllCategoriesLoading());
    var result = await _homeRepo.getAllCategories();
    result.fold(
      (failure) => emit(AllCategoriesFailure(failure.message)),
      (categories) => emit(AllCategoriesLoaded(categories)),
    );
  }
}
