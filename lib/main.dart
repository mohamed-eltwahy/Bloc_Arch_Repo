import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/app/app.dart';
import 'package:minapharm_pharmaceuticals_task/shared/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}
