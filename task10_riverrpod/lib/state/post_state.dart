// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:task10_riverrpod/models/post.dart';
import 'package:task10_riverrpod/services/http_get_services.dart';

final postProvider =
    StateNotifierProvider<PostNotifier, PostState>((ref) => PostNotifier());

@immutable
abstract class PostState {}

class InitialState extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded({
    required this.posts,
  });
}

class ErrorState extends PostState {
  final String message;
  ErrorState({
    required this.message,
  });
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier() : super(InitialState());
  final HttpGetPost _httpGetPost = HttpGetPost();
  void fetchPosts() async {
    try {
      state = PostLoading();
      List<Post> posts = await _httpGetPost.getpost();
      state = PostLoaded(posts: posts);
    } catch (e) {
      state = ErrorState(message: e.toString());
    }
  }
}
