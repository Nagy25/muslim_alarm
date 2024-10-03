import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:muslim_alarm/core/network/endpoints.dart';

class DioApiClient implements ApiClient {
  static final provider = Provider((_) => DioApiClient());

  DioApiClient();

  final _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseURL,
      connectTimeout: Duration(seconds: 10),
    ),
  );

  @override
  Future get(String url, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future post(String url,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? body}) {
    return _dio.post(url, queryParameters: queryParameters, data: body);
  }
}
