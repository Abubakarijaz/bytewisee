import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task10_riverrpod/models/post.dart';

class HttpGetPost {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String _baseEndpoint = '/posts';
  Future getpost() async {
    List<Post> posts = [];
    try {
      var postUri = Uri.parse('$_baseUrl$_baseEndpoint');
      http.Response response = await http.get(postUri);

      if (response.statusCode == 200) {
        List postLists = jsonDecode(response.body);
        for (var postListItems in postLists) {
          Post post = Post.fromMap(postListItems);
          posts.add(post);
        }
      }
      return posts;
    } catch (e) {
      print(e);
    }
  }
}
