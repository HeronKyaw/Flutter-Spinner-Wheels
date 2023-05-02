import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool obscure;
  final TextEditingController controller;
  const LoginTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
