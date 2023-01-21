import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minapharm_pharmaceuticals_task/businessLogic_layer/auth/auth_state.dart';
import 'package:minapharm_pharmaceuticals_task/shared/flutterToast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation_layer/screens/home_page.dart';
import '../../shared/apputil.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());
  static AuthCubit get(context) => BlocProvider.of(context);

  final signUpFormKey = GlobalKey<FormState>();
  final TextEditingController signUpEmail = TextEditingController();
  final TextEditingController signUpPassword = TextEditingController();

  Future register(
      String username, String password, BuildContext context) async {
      final prefs = await SharedPreferences.getInstance();
      log('usersList${prefs.getStringList('users')}');
      if (prefs.getStringList('users')?.contains(username) == true) {
        Fluttertoast.showToast(
            msg: 'userName already registered.',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 15);
        emit(state.copyWith(error: 'userName already registered.'));
      } else {
        final users = prefs.getStringList('users') ?? [];
        users.add(username);
        prefs.setStringList('users', users);
        prefs.setString('username', username);
        prefs.setString('password', password);
        emit(state.copyWith(isLoggedIn: true));
        Fluttertoast.showToast(
                msg: 'account created successfully.',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 15)
            .then((value) {
          AppUtill.navigatToAndFinish(context, const HomePage());
        });
      }
   
  }

  String? myString;
  void loadString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myString = prefs.getString('username')!;
    try {
      AuthState authState = json.decode(myString!);
      emit(authState);
    } catch (e) {
      log('errrorrr${e.toString()}');
    }
  }

  Future<void> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();

    final users = prefs.getStringList('users') ?? [];
    if (users.contains(username)) {
      if (prefs.getString('password') == password) {
        emit(state.copyWith(isLoggedIn: true));
      } else {
        emit(state.copyWith(error: 'Incorrect password.'));
      }
    } else {
      emit(state.copyWith(error: 'Email not registered.'));
    }
  }
}
