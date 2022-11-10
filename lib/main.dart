import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/appthemes.dart';

import 'package:posts_app/features/posts/presentation/bloc/add_update_delete_widgets/add_update_delete_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/pages/posts_page.dart';


import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //je construit la configuration de dépendances
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_) => di.sl<AddUpdateDeletePostBloc>())
      ],
      child: MaterialApp(
        title: 'Bonjour',
        theme: appTheme,
        home: PostPage(),
      ),
    );
  }
}
