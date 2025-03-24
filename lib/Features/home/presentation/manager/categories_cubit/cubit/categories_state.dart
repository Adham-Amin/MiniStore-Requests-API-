part of 'categories_cubit.dart';

sealed class AllCategoriesState extends Equatable {
  const AllCategoriesState();

  @override
  List<Object> get props => [];
}

final class AllCategoriesInitial extends AllCategoriesState {}
final class AllCategoriesLoaded extends AllCategoriesState {
  final List<String> categories;

  const AllCategoriesLoaded(this.categories);
}
final class AllCategoriesLoading extends AllCategoriesState {}
final class AllCategoriesFailure extends AllCategoriesState {
  final String message;

  const AllCategoriesFailure(this.message);
}
