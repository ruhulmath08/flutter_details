import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_details/src/features/post/root/domain/entities/post_entity.dart';
import 'package:flutter_details/src/features/post/root/domain/use_cases/get_all_posts_use_case.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.getAllPosts}) : super(const PostState()) {
    on<PostFetchedEvent>(_onPostFetchedEvent);
  }

  final GetAllPosts getAllPosts;

  Future<void> _onPostFetchedEvent(
    PostFetchedEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(state.copyWith(status: PostStatus.initial));
    try {
      final response = await getAllPosts.call();

      response.fold(
        (l) => emit(
          state.copyWith(
            status: PostStatus.failure,
            errorMessage: l,
          ),
        ),
        (r) => emit(
          state.copyWith(
            status: PostStatus.success,
            posts: r,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PostStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
