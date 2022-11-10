import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';
import 'package:posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/pages/post_add_update_page.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_widgets/post_detail_widgets/message_display_widget.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_widgets/post_detail_widgets/posts_list_widget.dart';
//import 'package:posts_app/features/posts/presentation/widgets/posts_widgets/message_display_widget.dart';
//import 'package:posts_app/features/posts/presentation/widgets/posts_widgets/posts_list_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  AppBar _buildAppBar() => AppBar(title: const Text('Posts'));

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
        if (state is LoadingPostsState) {
          return const LoadingWidget();
        } else if (state is LoadedPostsState) {
          return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: PostListWidget(posts: state.posts));
        } else if (state is ErrorPostsState) {
          return MessageDisplayWidget(message: state.message);
        } else {
          return const LoadingWidget();
        }
      }),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const PostAddUpdatePage(
                      isUpdatePost: false,
                    )));
      },
      child: const Icon(Icons.add),
    );
  }
}
