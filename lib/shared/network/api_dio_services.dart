import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class APIDioService {
  Dio? _dio;
  Connectivity? _connectivity;

  APIDioService() {
    _dio = Dio();
    _connectivity = Connectivity();
  }

  Future<dynamic> request(String method, String url, {Map<String, dynamic>? data,Map<String, dynamic>? header}) async {
    try {
      final connectivityResult = await _connectivity!.checkConnectivity();
      if (connectivityResult != ConnectivityResult.none) {
        final response = await _dio?.request(
          url,
          options: Options(headers: header,
            method: method,
          ),
          data: data,
        );

        return response!.data;
      } else {
        throw Exception('No internet connection');
      }
    } catch (error) {
      if (error is DioError) {
        // Handle Dio network connectivity errors
        if (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.receiveTimeout ||
            error.type == DioErrorType.sendTimeout) {
          throw Exception('Connection timeout');
        } else if (error.type == DioErrorType.response) {
          throw Exception('Received invalid status code: ${error.response!.statusCode}');
        } else if (error.type == DioErrorType.cancel) {
          throw Exception('Request was canceled');
        } else {
          throw Exception('Failed to make API request: ${error.message}');
        }
      } else {
        // Handle general errors
        throw Exception('Failed to make API request: $error');
      }
    }
  }
}
