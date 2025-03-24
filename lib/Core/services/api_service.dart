import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://fakestoreapi.com';

  ApiService(this._dio);

  Future<dynamic> get({
    required String endPoint,
    @required String? token,
  }) async {
    Map<String, dynamic> queryParameters = {};

    if (token != null) {
      queryParameters.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }

    final Response response = await _dio.get(
      '$baseUrl$endPoint',
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    @required Map<String, dynamic>? body,
    @required String? token,
  }) async {
    
    Map<String, dynamic> queryParameters = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    if (token != null) {
      queryParameters.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }
    final Response response = await _dio.post('$baseUrl$endPoint',
        data: body, queryParameters: queryParameters);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    @required Map<String, dynamic>? body,
    @required String? token,
  }) async {

    Map<String, dynamic> queryParameters = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    if (token != null) {
      queryParameters.addAll(
        {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
    }

    final Response response = await _dio.put(
      '$baseUrl$endPoint',
      data: body,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
