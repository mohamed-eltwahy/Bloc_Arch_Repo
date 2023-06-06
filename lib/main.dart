import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minapharm_pharmaceuticals_task/shared/network/api_dio_services.dart';
import 'presentation_layer/screens/app/app.dart';
import 'shared/app_bloc_observer.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<APIDioService>(APIDioService());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupDependencies();
  runApp(MyApp());
}