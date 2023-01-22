import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../businessLogic_layer/films_cubit/films_cubit.dart';
import '../../shared/appui.dart';
import '../widgets/fil_item.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FilmsCubit>().getallfilmsdata();
    // FilmsRepo.fetchFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUI.background,
      appBar: AppBar(
        title: const Text('Movies Screen'),
      ),
      body: BlocBuilder<FilmsCubit, FilmsState>(
        builder: (context, state) {
          if (state is FilmsLoading) {
            return Center(
                child: Lottie.asset('assets/lottie/loading.json', height: 70));
          } else if (state is FilmsLoaded) {
            return GridView.builder(
                itemCount: state.films.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1),
                itemBuilder: (context, index) {
                  return (index % 2 != 1)
                      ? Transform.translate(
                          offset: const Offset(0, 90),
                          child: FilmItem(listdata: state.films[index]),
                        )
                      : FilmItem(listdata: state.films[index]);
                });
          } else if (state is FilmsError) {
            return Center(
                child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
