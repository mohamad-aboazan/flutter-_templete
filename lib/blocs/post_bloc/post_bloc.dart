import 'package:bloc/bloc.dart';
import 'package:flutter_templete/models/post.dart';
import 'package:flutter_templete/repository/post_repo.dart';
import 'package:meta/meta.dart';
part 'post_event.dart';
part 'post_state.dart';

//==================== Using Simple Bloc =======================
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());

  PostRepo postRepo = PostRepo();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPostsEvent) {
      yield PostLoading();
      PostState postState = await postRepo.fetchPosts();
      yield postState;
    }
  }
}
//==================== Using (cubit - emit) =======================

class PostBlocTest extends Cubit<PostState> {
  PostBlocTest() : super(PostInitial());
  PostRepo postRepo = PostRepo();

  void getAllPosts() async {
    emit(PostLoading());
    PostState postState = await postRepo.fetchPosts();
    emit(postState);
  }
}
