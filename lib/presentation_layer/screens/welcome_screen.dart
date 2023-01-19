import 'package:flutter/material.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/login_screen.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/register_screen.dart';
import '../../shared/appui.dart';
import '../../shared/apputil.dart';
import '../../shared/components/appbtn.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
