import 'package:dartz/dartz.dart';
import 'package:flutter_details/src/features/post/root/data/models/post_model.dart';
import 'package:http/http.dart';

abstract class PostRemoteDataSource {
  Future<Response> getAllPosts();

  Future<Unit> deletePost(int postId);

  Future<Unit> updatePost(PostModel postModel);

  Future<Unit> addPost(PostModel postModel);
}