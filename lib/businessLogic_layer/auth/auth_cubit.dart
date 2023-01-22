import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation_layer/screens/home_page.dart';
import '../../shared/apputil.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());
  static AuthCubit get(context) => BlocProvider.of(context);

  final signUpFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController signUpUsername = TextEditingController();
  final TextEditingController signUpPassword = TextEditingController();
  final TextEditingController loginUsername = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();
  bool loginVisibality = true;
  bool signInVisibality = true;
  IconData loginVisibilityIcon = Icons.visibility_off_outlined;
  IconData signInVisibilityIcon = Icons.visibility_off_outlined;

  void loginChangeVisibility() {
    loginVisibality = !loginVisibality;
    loginVisibilityIcon = loginVisibality
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(LoginVisibilityChangeState());
  }

  void signInChangeVisibility() {
    signInVisibality = !signInVisibality;
    signInVisibilityIcon = signInVisibality
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(SignInVisibilityChangeState());
  }

  Future register(
      String username, String password, BuildContext context) async {
    emit(AuthStateLoading());
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
      prefs.setBool("isLoggedIn", true);
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
        signUpPassword.clear();
        signUpUsername.clear();
      });
    }
  }

  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString('username') ?? '');
  }

  Future login(String username, String password, BuildContext context) async {
    emit(AuthStateLoading());
    final prefs = await SharedPreferences.getInstance();

    final users = prefs.getStringList('users') ?? [];
    if (users.contains(username)) {
      if (prefs.getString('password') == password) {
        prefs.setBool("isLoggedIn", true);
        emit(state.copyWith(isLoggedIn: true));
        Fluttertoast.showToast(
                msg: 'login successfully.',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 15)
            .then((value) {
          AppUtill.navigatToAndFinish(context, const HomePage());
          loginUsername.clear();
          loginPassword.clear();
        });
      } else {
        emit(state.copyWith(error: 'Incorrect password.'));
        Fluttertoast.showToast(
            msg: 'Incorrect password.',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 15);
      }
    } else {
      emit(state.copyWith(error: 'Email not registered.'));
      Fluttertoast.showToast(
          msg: 'Email not registered.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15);
    }
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn") ?? false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    // prefs.remove("username");
    // prefs.remove("password");
    // prefs.remove("users");
    emit(state.copyWith(isLoggedIn: false));
  }
}
