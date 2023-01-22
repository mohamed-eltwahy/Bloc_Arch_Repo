import '../models/films_model.dart';
import '../services/films_services.dart';

class FilmsRepo {
//     Future<List<Filmography>> getallfilmsdata() async {
//    var value = await FilmsServices.getallfilmsServices();
//    listFilms = value.map((item) => Filmography.fromJson(item)).toList();
//    return listFilms;
// }
  static dynamic fetchFilmsRepo() async {
    try {
      final films = await FilmsServices.getallfilmsServices().cast<Map<String, dynamic>>();
      return [Filmography.fromJson(films)];
      // final films = (await FilmsServices.getallfilmsServices());
      // return films.map((e) => Filmography.fromJson(e)).toList();
    } catch (e) {
      return Future.error('$e ', StackTrace.fromString(('trace error')));
    }
  }
}
