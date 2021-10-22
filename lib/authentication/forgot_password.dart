import 'package:flutter/material.dart';

class ForgotPassWord extends StatelessWidget {
  static const routeName = 'forgot-password';
  const ForgotPassWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        title: Text(
          'Forgot Password',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
