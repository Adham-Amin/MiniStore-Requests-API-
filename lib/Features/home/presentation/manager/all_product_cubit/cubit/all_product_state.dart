part of 'all_product_cubit.dart';

sealed class AllProductState extends Equatable {
  const AllProductState();

  @override
  List<Object> get props => [];
}

final class AllProductInitial extends AllProductState {}
final class AllProductLoading extends AllProductState {}
final class AllProductLoaded extends AllProductState {
  final List<ProductModel> products;
  const AllProductLoaded(this.products);
}
final class AllProductFailure extends AllProductState {
  final String message;

  const AllProductFailure(this.message);
  
}
