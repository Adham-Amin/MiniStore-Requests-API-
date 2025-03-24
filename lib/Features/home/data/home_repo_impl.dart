import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mini_store/Core/error/failure.dart';
import 'package:mini_store/Core/models/product_model/product_model/product_model.dart';
import 'package:mini_store/Core/services/api_service.dart';
import 'package:mini_store/Features/home/data/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

  Future<Either<Failure, T>> _handleRequest<T>(Future<T> Function() request) async {
    try {
      final result = await request();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() {
    return _handleRequest(() async {
      List data = await _apiService.get(endPoint: '/products');
      return data.map((product) => ProductModel.fromJson(product)).toList();
    });
  }

  @override
  Future<Either<Failure, List<String>>> getAllCategories() {
    return _handleRequest(() async {
     var data = await _apiService.get(endPoint: '/products/categories');
     List<String> categories = List<String>.from(data);
     return categories;
    });
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getCategoriesProducts({required String category}) {
    return _handleRequest(() async {
      List data = await _apiService.get(endPoint: '/products/category/$category');
      return data.map((product) => ProductModel.fromJson(product)).toList();
    });
  }

  @override
  Future<Either<Failure, ProductModel>> addProducts({
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) {
    return _handleRequest(() async {
      final data = await _apiService.post(
        endPoint: '/products',
        body: ProductModel(
          title: title,
          price: price,
          description: description,
          image: image,
          category: category,
        ).toJson(),
      );
      return ProductModel.fromJson(data);
    });
  }

  @override
  Future<Either<Failure, ProductModel>> updateProducts({
    required String id,
    required String title,
    required double price,
    required String description,
    required String image,
  }) {
    return _handleRequest(() async {
      final data = await _apiService.put(
        endPoint: '/products/$id',
        body: ProductModel(
          title: title,
          price: price,
          description: description,
          image: image,
        ).toJson(),
      );
      return ProductModel.fromJson(data);
    });
  }
}