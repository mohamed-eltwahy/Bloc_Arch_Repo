import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businessLogic_layer/films_cubit/films_cubit.dart';
import '../../data_layer/repositories/films_repo.dart';
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
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
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
              style: TextStyle(color: Colors.red),
            ));
          } else {
            return Container();
          }
        },
      ),
      // body: BlocConsumer<FilmsCubit, FilmsState>(
      //   listener: (BuildContext context, Object? state) {},
      //   builder: (BuildContext context, state) {
      //     return ListView(
      //       shrinkWrap: true,
      //       children: [
      //         context.read<FilmsCubit>().listFilms.isEmpty
      //             ? const Center(child: Text('no data'))
      //             : GridView.builder(
      //                 itemCount: context.read<FilmsCubit>().listFilms.length,
      //                 shrinkWrap: true,
      //                 physics: const ClampingScrollPhysics(),
      //                 gridDelegate:
      //                     const SliverGridDelegateWithFixedCrossAxisCount(
      //                         crossAxisCount: 2,
      //                         childAspectRatio: 2 / 3,
      //                         mainAxisSpacing: 1,
      //                         crossAxisSpacing: 1),
      //                 itemBuilder: (context, index) {
      //                   return (index % 2 != 1)
      //                       ? Transform.translate(
      //                           offset: const Offset(0, 90),
      //                           child: FilmItem(
      //                               listdata: context
      //                                   .read<FilmsCubit>()
      //                                   .listFilms[index]),
      //                         )
      //                       : FilmItem(
      //                           listdata: context
      //                               .read<FilmsCubit>()
      //                               .listFilms[index]);
      //                 })
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
