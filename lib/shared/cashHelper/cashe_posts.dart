import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../data_layer/models/films_model.dart';

// class Post {
//   int? id;
//   String? title;
//   String? image;

//   Post({this.id, this.title, this.image});

//   Map<String, dynamic> toJson() => {'id': id, 'title': title, 'image': image};

//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//         id: json['id'],
//         title: json['title'],
//         image: json['image'],
//       );
// }

savePosts(List<Filmography> posts) async {
  // Get the instance of SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  // Convert the list of posts to a JSON string
  String jsonString = jsonEncode(posts);

  // Save the JSON string to SharedPreferences
  prefs.setString('posts', jsonString);
}

Future<List<Filmography>> getPosts() async {
  // Get the instance of SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  // Retrieve the JSON string from SharedPreferences
  String? jsonString = prefs.getString('posts');

  // If the JSON string is null, return an empty list
  if (jsonString == null) {
    return [];
  }

  // Convert the JSON string to a list of posts
  List<Filmography> posts =
      jsonDecode(jsonString).map((post) => Filmography.fromJson(post)).toList();

  return posts;
}
