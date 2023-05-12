import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data_service.dart';
import 'post.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}

abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<Post> posts;
  LoadedPostsState({required this.posts});
}

class FailedToLoadPostsState extends PostsState {
  Object error;
  FailedToLoadPostsState({required this.error});
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();


  PostsBloc() : super(LoadingPostsState()) {
    on<LoadPostsEvent>(_mapEventToState);
    on<PullToRefreshEvent>(_mapEventToState);
  }

  void _mapEventToState(PostsEvent event, Emitter<PostsState> emit) async {
    if (event is LoadPostsEvent || event is PullToRefreshEvent) {
      debugPrint("Loading");
      emit(LoadingPostsState());

      try {
        debugPrint("Making request");
        final posts = await _dataService.getPosts();
        emit(LoadedPostsState(posts: posts));
      } catch (e) {
        debugPrint("Error");
        emit(FailedToLoadPostsState(error: e));
      }
    }
  }
}