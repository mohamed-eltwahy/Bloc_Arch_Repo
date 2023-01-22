import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minapharm_pharmaceuticals_task/businessLogic_layer/auth/auth_cubit.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/movies_screen.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/welcome_screen.dart';
import 'package:minapharm_pharmaceuticals_task/shared/apputil.dart';
import '../../businessLogic_layer/auth/auth_state.dart';
import '../../shared/appui.dart';
import '../../shared/components/appbtn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 String? userName;
@override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getUsername().then((value) {
      setState(() {
        userName = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUI.background,
      appBar: AppBar(
        title:BlocBuilder<AuthCubit, AuthState>(
           builder: (context, state) {
            return Text("Welcome, $userName");
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().logout().then((value) {
                AppUtill.navigatToAndFinish(context, const WelcomeScreen());
              });
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              "Movies Screen",
              onTap: () async {
                AppUtill.navigatTo(context, const MoviesScreen());
              },
              titleColor: Colors.white,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
