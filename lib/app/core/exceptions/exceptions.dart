import 'package:dio/dio.dart';

/// error handle
ErrorEntity createErrorEntity(DioError error) {
  switch (error.type) {
    case DioErrorType.cancel:
      return ErrorEntity(code: -1, message: "Request cancel");

    case DioErrorType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connect timeout");

    case DioErrorType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send timeout");

    case DioErrorType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive timeout");

    case DioErrorType.unknown:
      return ErrorEntity(code: -1, message: 'Unknown error');

    case DioErrorType.badResponse:
      try {
        int errCode = error.response?.statusCode ?? 999;
        // String errMessage = Meta.fromJson(error.response?.data['meta']).message ?? 'Unknown error';
        String errorMessage = error.response?.data['message'];
        switch (errCode) {
          case 400:
            return ErrorEntity(code: errCode, message: errorMessage);

          case 401:
            return ErrorEntity(code: errCode, message: errorMessage);

          case 403:
            return ErrorEntity(code: errCode, message: errorMessage);

          case 404:
            return ErrorEntity(code: errCode, message: errorMessage);

          case 405:
            return ErrorEntity(code: errCode, message: errorMessage);

          case 500:
            return ErrorEntity(code: errCode, message: errorMessage);

          case 502:
            return ErrorEntity(code: errCode, message: errorMessage);

          case 503:
            return ErrorEntity(code: errCode, message: errorMessage);

          case 505:
            return ErrorEntity(code: errCode, message: errorMessage);

          default:
            {
              return ErrorEntity(
                  code: errCode, message: error.response?.statusMessage ?? "");
            }
        }
      } on Exception catch (_) {
        return ErrorEntity(code: -1, message: "Unknown error");
      }

    default:
      return ErrorEntity(code: -1, message: error.message ?? '');
  }
}

class ErrorEntity implements Exception {
  int code;
  String message;

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message.isEmpty) return "Exception";
    return "Exception: code $code, $message";
  }
}