part of 'update_product_cubit.dart';

sealed class UpdateProductState extends Equatable {
  const UpdateProductState();

  @override
  List<Object> get props => [];
}

final class UpdateProductInitial extends UpdateProductState {}
final class UpdateProductLoaded extends UpdateProductState {
  final ProductModel product;

  const UpdateProductLoaded({required this.product});
}
final class UpdateProductLoading extends UpdateProductState {}
final class UpdateProductFailure extends UpdateProductState {
  final String message;

  const UpdateProductFailure({required this.message});
}
