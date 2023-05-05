import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscure;
  final TextEditingController controller;

  const LoginTextField(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color.fromRGBO(78, 1, 137, 1),
              fontWeight: FontWeight.w600,
              fontSize: 14
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: obscure,
            controller: controller,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(31, 31, 31, 0.43)
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(198, 198, 198, 1)
                )
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color.fromRGBO(78, 1, 137, 1)
                )
              )
            ),
          ),
        ],
    );
  }
}
