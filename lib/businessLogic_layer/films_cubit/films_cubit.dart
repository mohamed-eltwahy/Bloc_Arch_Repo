import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/models/films_model.dart';
import '../../data_layer/repositories/films_repo.dart';

part 'films_state.dart';

class FilmsCubit extends Cubit<FilmsState> {
  FilmsCubit() : super(FilmsInitial());
  static FilmsCubit get(context) => BlocProvider.of(context);
List<Filmography> filmsStored=[];
  Future<void> getallfilmsdata() async {
    try {
      emit(FilmsLoading());
      final films = await FilmsRepo.fetchFilmsRepo();
      emit(FilmsLoaded(films: films));
      filmsStored=films;
      return films;
    } catch (e) {
      emit(FilmsError(message: e.toString()));
      log('err${e.toString()}');
    }
  }
}
