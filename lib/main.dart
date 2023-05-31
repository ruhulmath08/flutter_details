import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_details/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_details/src/features/login/presentation/pages/login_page.dart';
import 'package:flutter_details/src/features/post/presentation/get_all_posts/bloc/post_bloc.dart';
import 'package:flutter_details/src/features/post/root/domain/use_cases/get_all_posts_use_case.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => PostBloc(getAllPosts: GetAllPosts())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
