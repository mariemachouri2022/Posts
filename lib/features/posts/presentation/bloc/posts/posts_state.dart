part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

//les posts sont en cours de récupération
class LoadingPostsState extends PostsState {}

//les posts sont récupéres vous pouvez les trouvez à l'interier de cet objet
class LoadedPostsState extends PostsState {
  final List<Post> posts;

  LoadedPostsState({required this.posts});

  @override
  List<Object> get props => [posts];
}
//j'ai pas pu récupérer la liste des posts, vous trouver la cause dans l'objet
class ErrorPostsState extends PostsState {
  final String message;

  ErrorPostsState({required this.message});

  @override
  List<Object> get props => [message];
}
