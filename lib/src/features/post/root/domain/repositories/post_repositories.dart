import 'package:dartz/dartz.dart';
import 'package:flutter_details/src/features/post/root/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<String, List<PostEntity>>> getAllPosts();

  Future<Either<String, bool>> deletePosts(int postId);

  Future<Either<String, PostEntity>> updatePosts(PostEntity post);

  Future<Either<String, PostEntity>> addPosts(PostEntity post);
}