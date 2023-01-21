import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minapharm_pharmaceuticals_task/businessLogic_layer/auth/auth_cubit.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/movies_screen.dart';
import 'package:minapharm_pharmaceuticals_task/shared/apputil.dart';
import 'package:minapharm_pharmaceuticals_task/shared/cashHelper/cash_helper.dart';
import '../../businessLogic_layer/auth/auth_state.dart';
import '../../shared/appui.dart';
import '../../shared/components/appbtn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  @override
  void initState() {
    username = CashHelper.getSavedString("username", "").toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUI.background,
      appBar: AppBar(
        title: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Text('welcome ${context.read<AuthCubit>().myString}');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
