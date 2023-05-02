import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinner_wheel/data/repositories/spinner_wheels_repository.dart';
import 'package:spinner_wheel/main.dart';
import 'package:spinner_wheel/screens/login/bloc/login_bloc.dart';
import 'package:spinner_wheel/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(SpinnerWheelRepositoryImpl()),
      child: const LoginView(title: 'Log In'),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  LoginViewState createState() => LoginViewState();
}


class LoginViewState extends State<LoginView> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Success"),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("LOGIN FAILURE"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {  
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              'You are logged in as ${snapshot.data!.email}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context.read<LoginBloc>().add(
                                  const LogoutButtonPressed(),
                                );
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      );               
                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Something went wrong!'),
                      );
                    }else {
                      return Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            const Text(
                              'Welcome to MyApp',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            LoginTextField(
                              hintText: 'Enter Email',
                              controller: _userNameController,
                              obscure: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            LoginTextField(
                              hintText: 'Enter Password',
                              controller: _passwordController,
                              obscure: true,
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO: Implement forgot password functionality
                              },
                              child: const Text('Forgot password?'),
                            ),
                            ElevatedButton(
                              onPressed: () async{
                                showDialog(
                                  context: context, 
                                  builder: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                );
                                context.read<LoginBloc>().add(
                                  LoginButtonPressed(
                                    username: _userNameController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                                // remove circular animation cuz Navigator.of(context).pop() does not work.
                                navigatorKey.currentState!.popUntil((route) => route.isFirst);
                              },
                              child: const Text('Sign in'),
                            ),
                            const Text(
                              'Or',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                // TODO: Implement Google sign-in functionality
                              },
                              icon: const Icon(Icons.login),
                              label: const Text('Sign in with Google'),
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO: Implement sign-up functionality
                              },
                              child: const Text('Don\'t have an account? Sign up'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                ),
              ),
            );
        },
      ),
    );
  }
}
