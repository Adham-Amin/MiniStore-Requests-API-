import 'package:dartz/dartz.dart';
import 'package:mini_store/Core/error/failure.dart';
import 'package:mini_store/Core/models/product_model/product_model/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, ProductModel>> addProducts({
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  });

  Future<Either<Failure, ProductModel>> updateProducts({
    required String id,
    required String title,
    required double price,
    required String description,
    required String image,
  });

  Future<Either<Failure, List<ProductModel>>> getCategoriesProducts({
    required String category,
  });
  Future<Either<Failure, List<String>>> getAllCategories();
}
