import 'package:dio/dio.dart';
import 'package:mini_store/Core/error/failure.dart';

class ApiService {
  final Dio _dio;
  static const String baseUrl = 'https://fakestoreapi.com';

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }

  Options _buildOptions(String? token) {
    return Options(
      headers: {
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );
  }

  Future<dynamic> get({
    required String endPoint,
    String? token,
  }) async {
    try {
      final response = await _dio.get(endPoint, options: _buildOptions(token));
      return response.data;
    } catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      final response = await _dio.post(endPoint, data: body, options: _buildOptions(token));
      return response.data;
    } catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      final response = await _dio.put(endPoint, data: body, options: _buildOptions(token));
      return response.data;
    } catch (e) {
      throw _handleDioError(e);
    }
  }

  Failure _handleDioError(dynamic e) {
    if (e is DioException) {
      return ServerFailure.fromDioException(e);
    } else {
      return ServerFailure(e.toString());
    }
  }
}
