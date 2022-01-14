import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String textHolder;
  final bool isPassword;
  final String? Function(String?) validator;
  final TextEditingController? controller;

  const InputField({
    Key? key,
    required this.title,
    required this.textHolder,
    required this.isPassword,
    required this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          style: const TextStyle(color: Colors.black),
          obscureText: isPassword,
          validator: (val) => validator(val),
          controller: controller,
          decoration: InputDecoration(
            hintText: textHolder,
          ),
        ),
      ],
    );
  }
}
