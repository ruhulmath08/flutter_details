import 'package:flutter/material.dart';
import 'package:flutter_details/src/features/post/root/domain/entities/post_entity.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.index,
    required this.postEntity,
  }) : super(key: key);

  final int index;
  final PostEntity postEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(index.toString()),
        ),
        title: Text(postEntity.title),
        subtitle: Text(postEntity.title),
      ),
    );
  }
}
