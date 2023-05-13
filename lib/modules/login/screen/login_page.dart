import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spinner_wheel/data/repositories/spinner_wheels_repository.dart';
import 'package:spinner_wheel/main.dart';
import 'package:spinner_wheel/bloc/login/login_bloc.dart';
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
  bool isChecked = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Success"),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("LOGIN FAILURE"),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is CheckedRememberMe) {
            isChecked = state.isChecked;
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
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 64),
                          const Text(
                            'Hi, Wecome Back! 👋',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            'Hello again, you’ve been missed!',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(153, 158, 161, 1)
                            ),
                          ),
                          const Gap(46),
                          LoginTextField(
                            title: 'Email',
                            hintText: 'Please enter your email',
                            controller: _userNameController,
                            obscure: false,
                          ),
                          const Gap(15),
                          LoginTextField(
                            title: 'Password',
                            hintText: 'Enter Password',
                            controller: _passwordController,
                            obscure: true,
                          ),
                          const Gap(20),
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
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 16)),
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(78, 1, 137, 1)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                              )
                            ),
                            child: const Text('Login'),
                          ),
                        ],
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
