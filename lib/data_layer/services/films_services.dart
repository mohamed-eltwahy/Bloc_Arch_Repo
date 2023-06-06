import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:minapharm_pharmaceuticals_task/main.dart';

import '../../shared/network/api_dio_services.dart';

class FilmsServices {
  final APIDioService apiService = getIt<APIDioService>();

  void _makeAPIRequest() async {
    try {
      final response =
          await apiService.request('get', 'https://api.example.com/data');

      // Process the API response here
      print(response);
    } catch (error) {
      // Handle error cases
      print(error);
    }
  }

  static dynamic getallfilmsServices() async {
    try {
      Dio dio = Dio();
      dio.interceptors.add(DioCacheManager(CacheConfig(
              baseUrl: "https://imdb8.p.rapidapi.com/actors/",
              defaultMaxAge: const Duration(hours: 1)))
          .interceptor);
      Map<String, String> headers = {
        'X-RapidAPI-Key': 'e71585032bmshd5966a5385a5c1dp1bed63jsn61f88daf108a',
        'X-RapidAPI-Host': 'imdb8.p.rapidapi.com',
      };
      dio.options.headers = headers;

      Response response = await dio.get(
          'https://imdb8.p.rapidapi.com/actors/get-all-filmography?nconst=nm0001667',
          options: buildCacheOptions(const Duration(minutes: 10),
              forceRefresh: true));
      return response.data['filmography'];
    } on DioError catch (e) {
      log(e.message);
      return Future.error('$e ', StackTrace.fromString(('trace error')));
    }
  }
}
