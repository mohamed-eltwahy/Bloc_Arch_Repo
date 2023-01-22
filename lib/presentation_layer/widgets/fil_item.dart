// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            'iiiiiii',
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: Colors.grey[400],
          child: Text(
            'sssssiiiiiii',
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          // child:FadeInImage.assetNetwork(
          //         width: double.infinity,
          //         height: double.infinity,
          //         placeholder: 'assets/images/loading.gif',
          //         image:listdata!.image as String,
          //         fit: BoxFit.cover,
          //       ),
              // : Image.asset('assets/images/notfound.jpg'),
        ),
      ),
    );
  }
}
