import 'package:dio/dio.dart';
import 'package:football_apps/constants/constants.dart';

class Api {

  Dio apiClient() {
    BaseOptions options = new BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: 60000,
      receiveTimeout: 60000,
      headers: {
        "Content-Type"  : "application/json",
      }
    );

    return new Dio(options);
  }

}