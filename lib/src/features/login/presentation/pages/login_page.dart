import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_details/src/features/home/presentation/pages/home_page.dart';
import 'package:flutter_details/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_details/src/features/post/presentation/get_all_posts/pages/post_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    return value!.isEmpty ? 'Username cannot be empty' : null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    return value!.isEmpty ? 'Password cannot be empty' : null;
                  },
                ),
                const SizedBox(height: 10),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostPage(),
            ),
          );
        } else if (state is ErrorState) {
          Fluttertoast.showToast(msg: 'Failed to login');
        }
      },
      // buildWhen: (previous, current) => (current is LoadingState ||
      //     current is ErrorState ||
      //     current is SuccessState),
      builder: (context, state) {
        if (state is LoadingState) {
          return const CircularProgressIndicator();
        }
        return ElevatedButton(
          onPressed: () {
            if(formKey.currentState!.validate()){
              context.read<LoginBloc>().add(
                LoginSubmitEvent(
                  email: emailController.text.trim(),
                  password: passwordController.text,
                ),
              );
            }
          },
          child: const Text('Login'),
        );
      },
    );
  }
}
