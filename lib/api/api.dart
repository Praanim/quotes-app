import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  final _dio = Dio();

  Api() {
    _dio.options.contentType = 'application/json';
    _dio.options.baseUrl = "https://favqs.com/api";
    _dio.interceptors.add(PrettyDioLogger());
  }
  Dio get sendRequest => _dio;
}
