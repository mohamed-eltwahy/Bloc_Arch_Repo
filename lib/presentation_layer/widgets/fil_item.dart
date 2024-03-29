import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../data_layer/models/films_model.dart';

class FilmItem extends StatelessWidget {
  final Filmography? listdata;

  const FilmItem({
    Key? key,
    this.listdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            listdata!.title!,
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: Colors.grey[400],
          child: listdata!.image != null
              ? CachedNetworkImage(
                  width: double.infinity,
                  height: double.infinity,
                  imageUrl: listdata!.image!.url!,
                  placeholder: (context, url) =>
                      Center(child: Lottie.asset('assets/lottie/loading.json', height: 80.h)),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/error.png'),
                      fit: BoxFit.cover,
                )
              // FadeInImage.assetNetwork(
              //     width: double.infinity,
              //     height: double.infinity,
              //     placeholder: 'assets/images/error.png',
              //     image: listdata!.image!.url!,
              //     fit: BoxFit.cover,
              //   )
              : Image.asset('assets/images/error.png'),
        ),
      ),
    );
  }
}
