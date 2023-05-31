import 'package:dartz/dartz.dart';
import 'package:flutter_details/src/features/post/root/data/repositories/post_repository_impl.dart';
import 'package:flutter_details/src/features/post/root/domain/entities/post_entity.dart';
import 'package:flutter_details/src/features/post/root/domain/repositories/post_repositories.dart';

class GetAllPosts{
  final PostRepository postRepository = PostRepositoryIml();

  Future<Either<String, List<PostEntity>>> call() async{
    return await postRepository.getAllPosts();
  }
}