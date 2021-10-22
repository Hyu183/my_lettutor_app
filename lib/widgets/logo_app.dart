import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
