import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mini_store/Core/error/failure.dart';
import 'package:mini_store/Core/models/category_model/category_model.dart';
import 'package:mini_store/Core/models/product_model/product_model/product_model.dart';
import 'package:mini_store/Core/services/api_service.dart';
import 'package:mini_store/Features/home/data/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      List data = await _apiService.get(endPoint: '/products', token: '');

      List<ProductModel> products = [];

      for (var product in data) {
        products.add(ProductModel.fromJson(product));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAllCategories() async {
    try {
      var data =
          await _apiService.get(endPoint: '/products/categories', token: '');

      if (data is List) {
        List<String> categories = CategoryModel.fromJson(data).categories;
        return right(categories);
      }
      else {
        return left(ServerFailure("Unexpected data format: $data"));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  
  @override
  Future<Either<Failure, List<ProductModel>>> getCategoriesProducts({required String category}) async {
    try {
      List data = await _apiService.get(endPoint: '/products/category/$category', token: '');

      List<ProductModel> products = [];

      for (var product in data) {
        products.add(ProductModel.fromJson(product));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}
