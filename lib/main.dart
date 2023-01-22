import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'presentation_layer/screens/app/app.dart';
import 'shared/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}
