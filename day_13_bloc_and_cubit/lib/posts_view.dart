import 'package:day_13_bloc_and_cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post.dart';

class PostsView extends StatelessWidget {
  final PostsCubit postCubit;

  const PostsView({super.key, required this.postCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsCubit, List<Post>>(
        builder: (context, posts) {
          if (posts.isEmpty) {
            return Center(
              child: ElevatedButton(
                  onPressed: () => getPosts(), child: const Text("Get posts")),
            );
          }

          return Column(children: [
              Text("Number of posts: ${posts.length}"),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(posts[index].title),
                  ),
                );
              }),),

          ],);
        },
      ),
    );
  }

  void getPosts() async {
    postCubit.getPosts();
  }
}
