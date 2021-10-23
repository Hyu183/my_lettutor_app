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
          obscureText: isPassword,
          validator: (val) => validator(val),
          controller: controller,
          decoration: InputDecoration(
            hintText: textHolder,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
