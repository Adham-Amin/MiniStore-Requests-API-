part of 'categories_products_cubit.dart';

sealed class CategoriesProductsState extends Equatable {
  const CategoriesProductsState();

  @override
  List<Object> get props => [];
}

final class CategoriesProductsInitial extends CategoriesProductsState {}
final class CategoriesProductsLoading extends CategoriesProductsState {}
final class CategoriesProductsLoaded extends CategoriesProductsState {
  final List<ProductModel> products;

  const CategoriesProductsLoaded({required this.products});
}
final class CategoriesProductsFailure extends CategoriesProductsState {
  final String errorMessage;

  const CategoriesProductsFailure({required this.errorMessage});
}
