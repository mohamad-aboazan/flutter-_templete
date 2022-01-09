import 'dart:convert';
import 'package:flutter_templete/blocs/post_bloc/post_bloc.dart';
import 'package:flutter_templete/models/post.dart';
import 'package:flutter_templete/services/api_services.dart';
import 'package:flutter_templete/utils/endpoints.dart';

class PostRepo {
  ApiService _apiService = ApiService();

  Future<PostState> fetchPosts() async {
    var response = await _apiService.request(
        requestType: RequestType.GET, endPoint: Endpoints.POSTS);

    if (response['state'] == ResponseState.success) {
      List items = jsonDecode(response["body"]);
      List<Post> posts = [];
      for (var post in items) {
        posts.add(Post.fromJson(post));
      }
      return PostLoaded(posts: posts);
    } else {
      return PostError(message: response["message"]);
    }
  }
}
