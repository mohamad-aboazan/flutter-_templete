import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_templete/blocs/post_bloc/post_bloc.dart';
import 'package:flutter_templete/models/post.dart';
import 'package:flutter_templete/view/widgets/post_card.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostBloc>(context).add(FetchPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              // Call Loading widget
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostLoaded) {
              List<Post> posts = state.posts;
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (BuildContext context, int i) {
                  return PostCard(post: posts[i]);
                },
              );
            } else if (state is PostError) {
              //Display ScaffoldMessage Or Put Your Error Widget
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text("somthing not working"));
            }
          },
        ),
      ),
    );
  }
}
