import 'dart:developer';

import 'package:dio/dio.dart';

class FilmsServices {
  static dynamic getallfilmsServices() async {
    try {
      Dio dio = Dio();

      Map<String, String> headers = {
        'X-RapidAPI-Key': 'e71585032bmshd5966a5385a5c1dp1bed63jsn61f88daf108a',
        'X-RapidAPI-Host': 'imdb8.p.rapidapi.com',
      };
      Response response = await dio.get(
        'https://imdb8.p.rapidapi.com/actors/get-all-filmography?nconst=nm0001667',
        options: Options(headers: headers),
      );
      return response.data['filmography'];
    } catch (e) {
      return Future.error(
          '$e ', StackTrace.fromString(('trace error')));
    }
  }
}
