import 'package:flutter/material.dart';
import 'package:flutter_templete/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  PostCard({this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(post.title),
            Text(post.userId.toString()),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
