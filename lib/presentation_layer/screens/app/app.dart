import 'package:flutter/material.dart';
import '../../../shared/appui.dart';

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
    return MaterialApp(
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // scaffoldBackgroundColor: AppUI.maincolors,
          primarySwatch: AppUI.secondColor,
          timePickerTheme: TimePickerThemeData(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            hourMinuteShape: const CircleBorder(),
          ),
        ),
        home: Container());
  }
}
