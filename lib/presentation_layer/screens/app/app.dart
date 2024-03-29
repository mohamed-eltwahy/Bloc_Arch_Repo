import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../businessLogic_layer/auth/auth_cubit.dart';
import '../../../businessLogic_layer/films_cubit/films_cubit.dart';
import '../../../shared/appui.dart';
import '../welcome_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<FilmsCubit>(
          create: (context) => FilmsCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
              title: 'Flutter Task',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // scaffoldBackgroundColor: AppUI.maincolors,
                primarySwatch: AppUI.secondColor,
                timePickerTheme: TimePickerThemeData(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hourMinuteShape: const CircleBorder(),
                ),
              ),
              home: const WelcomeScreen());
        },
      ),
    );
  }
}
