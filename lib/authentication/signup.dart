import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  static const routeName = '/sign-up';
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Sign up',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
