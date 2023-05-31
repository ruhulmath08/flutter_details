import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_details/src/features/post/presentation/get_all_posts/bloc/post_bloc.dart';
import 'package:flutter_details/src/features/post/presentation/get_all_posts/widgets/post_card.dart';
import 'package:flutter_details/src/features/post/root/domain/entities/post_entity.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PostBloc, PostState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            switch (state.status) {
              case PostStatus.initial:
                return const Center(child: CircularProgressIndicator());

              case PostStatus.success:
                return state.posts.isNotEmpty ? ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    PostEntity postEntity = state.posts[index];
                    return PostCard(
                      index: index + 1,
                      postEntity: postEntity,
                    );
                  },
                ) : const Center(
                  child: Text('No data found in server'),
                );

              case PostStatus.failure:
                return Center(child: Text(state.errorMessage));
            }
          },
        ),
      ),
    );
  }
}
