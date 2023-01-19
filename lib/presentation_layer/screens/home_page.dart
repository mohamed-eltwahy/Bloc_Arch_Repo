import 'package:flutter/material.dart';
import 'package:minapharm_pharmaceuticals_task/presentation_layer/screens/movies_screen.dart';
import 'package:minapharm_pharmaceuticals_task/shared/apputil.dart';

import '../../shared/appui.dart';
import '../../shared/components/appbtn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUI.background,
      appBar: AppBar(
        title: const Text('wlcome mohammed'),
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
