import 'package:flutter/material.dart';

import '../../shared/appui.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUI.background,
      appBar: AppBar(
        title: const Text('Movies Screen'),
      ),
    );
  }
}
