import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {

  @override
  Future<dynamic> onRequest(RequestOptions options) async {

    if (options.headers.containsKey("requirestoken")) {

      options.headers.remove("requirestoken");

      options.headers.addAll({"Authorization": "Bearer "});

      return options;
    }
  }

  @override
  Future onError(DioError dioError) {
    String errorDescription = "";
    switch (dioError.type) {
      case DioErrorType.CANCEL:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        errorDescription =
        "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        errorDescription =
        "Received invalid status code: ${dioError.response.statusCode} ${dioError.response.request.path}";
        if(dioError.response.statusCode == 401) {
          if(dioError.response.request.path != "/users/login"){

          }

        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = "Send timeout in connection with API server";
        break;
    }
    dioError.error= errorDescription;
    return super.onError(dioError);
  }


}