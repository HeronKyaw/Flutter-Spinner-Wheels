import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinner_wheel/data/repositories/spinner_wheels_repository.dart';
import 'package:spinner_wheel/screens/login/bloc/login_bloc.dart';
import 'package:spinner_wheel/screens/login/views/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => LoginBloc(SpinnerWheelRepositoryImpl()),
          child: const LoginPage(),
      )
    );
  }
}
 