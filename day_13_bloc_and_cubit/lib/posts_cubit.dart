import 'package:flutter_bloc/flutter_bloc.dart';
import 'data_service.dart';
import 'post.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]); //Cubit constructor we set the initial value of state to an empty list (List<Post>)

  void getPosts() async {
    return emit(await _dataService.getPosts());
  }

  //In emit we return a List<Post>, we return the value we set in the extension Cubit<List<Post>>
  //This value is called "state" by default
}