import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final List<String> categories;

  const CategoryModel({required this.categories});

  factory CategoryModel.fromJson(List<dynamic> json) {
    return CategoryModel(categories: List<String>.from(json));
  }

  List<String> toJson() => categories;

  @override
  List<Object?> get props => [categories];
}
