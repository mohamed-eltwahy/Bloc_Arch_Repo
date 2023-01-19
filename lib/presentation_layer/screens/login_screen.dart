import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/home_page.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/register_screen.dart';

import '../../businessLogic_layer/login_cubit/login_cubit.dart';
import '../../data_layer/models/user_model.dart';
import '../../shared/appui.dart';
import '../../shared/apputil.dart';
import '../../shared/cashHelper/cash_helper.dart';
import '../../shared/components/appbtn.dart';
import '../../shared/components/apptext.dart';
import '../../shared/components/apptextfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: BlocConsumer<LoginCubit, LoginState>(
          listener: (BuildContext context, Object? state) {},
          builder: (BuildContext context, state) {
            var authCubit = LoginCubit.get(context);
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    height: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 200.0,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppUI.background,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Form(
                          key: authCubit.loginFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                'login',
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              AppTextFormField(
                                textColor: Colors.black,
                                context: context,
                                validator: (vaule) {
                                  if (vaule!.isEmpty) {
                                    return 'The email must not be empty ';
                                  } else {
                                    return null;
                                  }
                                },
                                hintText: 'email',
                                textInputType: TextInputType.emailAddress,
                                controller: authCubit.loginEmail,
                                // validateState: false,
                                suffixWidget: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              AppTextFormField(
                                hintText: 'pass',
                                textColor: Colors.black,
                                context: context,
                                validator: (vaule) {
                                  if (vaule!.isEmpty) {
                                    return 'The password must not be empty';
                                  } else if (vaule.length < 7) {
                                    return 'The password must not be less than \n 7 letters or numbers.';
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: authCubit.loginVisibality,
                                controller: authCubit.loginPassword,
                                validateState: true,
                                suffixIconOnTap:
                                    authCubit.loginChangeVisibility,
                                suffixIcon: authCubit.loginVisibilityIcon,
                                suffixColor: Colors.grey,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              state is! LoginLoadingState
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 100),
                                      child: AppButton(
                                        'login',
                                        onTap: () async {
                                          if (authCubit
                                              .loginFormKey.currentState!
                                              .validate()) {
                                            FocusScope.of(context).unfocus();
                                            Map<String, dynamic> formData = {
                                              "email":
                                                  authCubit.loginEmail.text,
                                              "password":
                                                  authCubit.loginPassword.text,
                                              "isLogined": true
                                            };
                                            await CashHelper.setJsonObject(
                                                    "signUpdata",
                                                    UserModel.fromJson(formData)
                                                        .toJson())
                                                .then((value) {
                                              AppUtill.navigatToAndFinish(
                                                  context, const HomePage());
                                            });
                                          }
                                        },
                                        titleColor: Colors.white,
                                        color: Colors.red,
                                      ),
                                    )
                                  : Center(
                                      child: Lottie.asset(
                                          'assets/lottie/loading.json',
                                          height: 70)),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    "Don't have account ? ",
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // UserModel.fromJson(json.decode(json.encode(UserModel(email:authCubit.loginEmail.text,password: authCubit.loginPassword.text,isLogined: true ).toJson())));

                                      // await CashHelper.setJsonObject("signUpdata",jsonEncode(UserModel.fromJson(formData)));
                                      // await  CashHelper.getJsonObject('signUpdata');
                                      //     .then((value) {
                                      //        CashHelper.getJsonObject('signUpdata');
                                      //   // CashHelper.getSavedString("signUpdata", "");
                                      //   // AppUtill.navigatToAndFinish(
                                      //   //     context, const RegisterScreen());
                                      // });
                                    },
                                    child: AppText(
                                      'signUp',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}
