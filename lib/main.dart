import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinner_wheel/data/repositories/spinner_wheels_repository.dart';
import 'package:spinner_wheel/firebase_options.dart';
import 'package:spinner_wheel/modules/login/login_bloc/login_bloc.dart';
import 'package:spinner_wheel/modules/login/screen/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        primaryColor: const Color.fromRGBO(78, 1, 137, 1),
        appBarTheme:  const AppBarTheme(
          backgroundColor: Color.fromRGBO(78, 1, 137, 1),
        )
      ),
      home: BlocProvider(
          create: (context) => LoginBloc(SpinnerWheelRepositoryImpl()),
          child: const LoginPage(),
      )
    );
  }
}
 