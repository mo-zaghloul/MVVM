import 'dart:convert';

import 'package:eabd/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostViewModel with ChangeNotifier {
  List<PostModel> _posts = [];
  bool _isLoading = false;

  List<PostModel> get posts => _posts;
  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        List<PostModel> fetchedPosts = (json.decode(response.body) as List)
            .map((post) => PostModel.fromJson(post))
            .toList();
        _posts = fetchedPosts;
      }
    } catch (e) {
      throw Exception('Failed to load posts');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
