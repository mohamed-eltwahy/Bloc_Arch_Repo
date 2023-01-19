
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool loginVisibality = true;
  IconData loginVisibilityIcon = Icons.visibility_off_outlined;
 String? userName;
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController loginEmail = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final TextEditingController signUpEmail = TextEditingController();
  final TextEditingController signUpPassword = TextEditingController();

  void loginChangeVisibility() {
    loginVisibality = !loginVisibality;
    loginVisibilityIcon = loginVisibality
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(LoginVisibilityChangeState());
  }


}
