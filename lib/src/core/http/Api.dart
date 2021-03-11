import 'package:dio/dio.dart';

import 'app_iterceptors.dart';

class ApiProvider {
  final String _baseApiURL = "http://<DOMAIN>:<PORT>/api/v1";


  String get urlApi => _baseApiURL;
  Dio dio;

  ApiProvider() {
    dio = Dio(BaseOptions(baseUrl: _baseApiURL));
    dio.interceptors.add(AppInterceptors());
  }

}
