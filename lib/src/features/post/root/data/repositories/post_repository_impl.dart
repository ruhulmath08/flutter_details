import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_details/src/features/post/root/data/data_sources/post_remote_data_source.dart';
import 'package:flutter_details/src/features/post/root/data/data_sources/post_remote_data_source_impl.dart';
import 'package:flutter_details/src/features/post/root/data/models/post_model.dart';
import 'package:flutter_details/src/features/post/root/domain/entities/post_entity.dart';
import 'package:flutter_details/src/features/post/root/domain/repositories/post_repositories.dart';
import 'package:http/http.dart';

class PostRepositoryIml implements PostRepository{
  final PostRemoteDataSource postRemoteDataSource = PostRemoteDataSourceImp();

  @override
  Future<Either<String, PostEntity>> addPosts(PostEntity post) {
    // TODO: implement addPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<String, bool>> deletePosts(int postId) {
    // TODO: implement deletePosts
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<PostEntity>>> getAllPosts() async{
    try {
      final Response response = await postRemoteDataSource.getAllPosts();

      final data = jsonDecode(response.body);

      List<PostEntity> models = data.map<PostModel>((element) => PostModel.fromJson(element))
          .toList();

      return Right(models);
    } catch (e, stackTrace) {
      print(e.toString());
      print(stackTrace.toString());

      return Left((e.toString()));
    }
  }

  @override
  Future<Either<String, PostEntity>> updatePosts(PostEntity post) {
    // TODO: implement updatePosts
    throw UnimplementedError();
  }
}