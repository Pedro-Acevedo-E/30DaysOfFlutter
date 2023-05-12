import 'package:day_15_bloc_navigation/post_details_view.dart';
import 'package:day_15_bloc_navigation/posts_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_cubit.dart';
import 'post.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post?>(builder: ((context, post) {
      return Navigator(
        pages: [
          const MaterialPage(child: PostsView()),
          if (post != null) MaterialPage(child: PostDetailsView(post: post)),
          if (post?.title == "qui est esse") //Test case
            MaterialPage(
              child: Scaffold(
                appBar: AppBar(title: const Text("Some data")),   //Appbar interacts with navigator giving it a return button
                body: const Text("Some data"),
              )
          )
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPosts();
          return route.didPop(result);
        },
      );
    }));
  }
}

//To prevent overlapping of views add unique conditions to pages that are not shared between them