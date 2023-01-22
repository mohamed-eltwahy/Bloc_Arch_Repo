
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'login_screen.dart';

import '../../businessLogic_layer/auth/auth_cubit.dart';
import '../../businessLogic_layer/auth/auth_state.dart';
import '../../shared/appui.dart';
import '../../shared/apputil.dart';
import '../../shared/components/appbtn.dart';
import '../../shared/components/apptext.dart';
import '../../shared/components/apptextfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: BlocConsumer<AuthCubit, AuthState>(
          listener: (BuildContext context, Object? state) {},
          builder: (BuildContext context, state) {
            var authCubit = AuthCubit.get(context);
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
                      borderRadius:  BorderRadius.only(
                        topRight: Radius.circular(40.r),
                        topLeft: Radius.circular(40.r),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Form(
                          key: authCubit.signUpFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                'signUp',
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                               SizedBox(
                                height: 50.h,
                              ),
                              AppTextFormField(
                                textColor: Colors.black,
                                context: context,
                                validator: (vaule) {
                                  if (vaule!.isEmpty) {
                                    return 'username must not be empty ';
                                  } else {
                                    return null;
                                  }
                                },
                                hintText: 'userName',
                                textInputType: TextInputType.name,
                                controller: authCubit.signUpUsername,
                                // validateState: false,
                                suffixWidget: const Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                              ),
                               SizedBox(
                                height: 15.h,
                              ),
                              AppTextFormField(
                                hintText: 'password',
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
                                obscureText: authCubit.signInVisibality,
                                controller: authCubit.signUpPassword,
                                validateState: true,
                                suffixIconOnTap:
                                    authCubit.signInChangeVisibility,
                                suffixIcon: authCubit.signInVisibilityIcon,
                                suffixColor: Colors.grey,
                              ),
                               SizedBox(
                                height: 30.h,
                              ),
                              state is! AuthStateLoading
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 100),
                                      child: AppButton(
                                        'signUp',
                                        onTap: () async {
                                          if (authCubit
                                              .signUpFormKey.currentState!
                                              .validate()) {
                                            FocusScope.of(context).unfocus();
                                            await authCubit
                                                .register(
                                                    authCubit.signUpUsername.text,
                                                    authCubit
                                                        .signUpPassword.text,
                                                    context)
                                                .then((value) {
                                              authCubit.getUsername();
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
                                          height: 70.h)),
                               SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    "have account ? ",
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      AppUtill.navigatToAndFinish(
                                          context, const LoginScreen());
                                    },
                                    child: AppText(
                                      'login',
                                      fontSize: 16.sp,
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
