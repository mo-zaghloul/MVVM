import 'package:eabd/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewModels/post_view_model.dart';

class PostListVeiw extends StatefulWidget {
  const PostListVeiw({super.key});

  @override
  _PostListVeiwState createState() => _PostListVeiwState();
}

class _PostListVeiwState extends State<PostListVeiw> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostViewModel>(context, listen: false).fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<PostViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
      ),
      body: ListView.builder(
        itemCount: postModel.posts.length,
        itemBuilder: (context, index) {
          final post = postModel.posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body,
                maxLines: 2, overflow: TextOverflow.ellipsis),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: postModel.fetchPosts,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
