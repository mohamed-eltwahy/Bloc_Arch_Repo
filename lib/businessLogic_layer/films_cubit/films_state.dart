part of 'films_cubit.dart';

@immutable
abstract class FilmsState {}

class FilmsInitial extends FilmsState {}

// class LoadingFilmsState extends FilmsState {}
// class LoadedFilmsState extends FilmsState {}

class FilmsLoading extends FilmsState {}

class FilmsLoaded extends FilmsState {
  final List<Filmography> films;

  FilmsLoaded({required this.films});
}

class FilmsError extends FilmsState {
  final String message;

  FilmsError({required this.message});
}
