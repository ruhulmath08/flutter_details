import 'package:dartz/dartz.dart';
import 'package:flutter_details/src/features/post/root/data/data_sources/post_remote_data_source.dart';
import 'package:flutter_details/src/features/post/root/data/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostRemoteDataSourceImp implements PostRemoteDataSource {
  var client = http.Client();

  @override
  Future<Unit> addPost(PostModel postModel) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int postId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Response> getAllPosts() async {
    var client = http.Client();
    var response = await client.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/posts',
      ),
    );

    return response;
  }

  @override
  Future<Unit> updatePost(PostModel postModel) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
