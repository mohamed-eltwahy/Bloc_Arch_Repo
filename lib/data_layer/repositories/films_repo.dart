import '../models/films_model.dart';
import '../services/films_services.dart';

class FilmsRepo {
  static dynamic fetchFilmsRepo() async {
    try {
      final films = await FilmsServices.getallfilmsServices();
      return films.map<Filmography>((e) => Filmography.fromJson(e)).toList();
    } catch (e) {
      return Future.error('$e ', StackTrace.fromString(('trace error')));
    }
  }
}
