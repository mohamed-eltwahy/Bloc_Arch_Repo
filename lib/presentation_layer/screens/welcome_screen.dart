import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/home_page.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/login_screen.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/register_screen.dart';
import '../../businessLogic_layer/auth/auth_cubit.dart';
import '../../shared/appui.dart';
import '../../shared/apputil.dart';
import '../../shared/components/appbtn.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().isLoggedIn().then((value) {
      if (value) {
        context.read<AuthCubit>().getUsername();
        AppUtill.navigatToAndFinish(context, const HomePage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppUI.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                'signUp',
                color: Colors.red,
                onTap: () {
                  AppUtill.navigatToAndFinish(context, const RegisterScreen());
                },
                titleColor: Colors.white,
                border: Border.all(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                'login',
                color: Colors.red,
                onTap: () {
                  AppUtill.navigatToAndFinish(context, const LoginScreen());
                },
                titleColor: Colors.white,
                border: Border.all(color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
