import 'package:flutter/material.dart';

class PhoneInput extends StatelessWidget {
//   final TextEditingController controller;
  const PhoneInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone number',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 20,
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hintText: 'Phone Number',
              border: InputBorder.none,
            ),
            keyboardType: const TextInputType.numberWithOptions(),
          ),
        ),
      ],
    );
  }
}
