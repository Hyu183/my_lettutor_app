import 'package:flutter/material.dart';

import 'package:my_lettutor_app/authentication/forgot_password.dart';
import 'package:my_lettutor_app/authentication/signup.dart';
import 'package:my_lettutor_app/widgets/button/large_button.dart';
import 'package:my_lettutor_app/widgets/button/my_icon_button.dart';
import 'package:my_lettutor_app/widgets/utils/input_field.dart';
import 'package:my_lettutor_app/widgets/utils/logo_app.dart';

typedef LoginCallback = void Function(int);

class Login extends StatelessWidget {
  static const routeName = '/login';
  final LoginCallback callback;

  Login({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? emailValidator(String? email) {
    print(email);
    if (email != null) {
      if (email.isEmpty) {
        return 'Email cannot be empty';
      } else if (!email.contains('@')) {
        return 'Please enter a valid email';
      }
      return null;
    }
    return null;
  }

  String? passwordValidator(String? password) {
    print(password);
    if (password != null) {
      if (password.isEmpty) {
        return 'Password cannot be empty';
      } else if (password.length < 8) {
        return 'Password must be at least 8 characters';
      }
      return null;
    }
    return null;
  }

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    if (_emailController.text != "admin@gmail.com" ||
        _passwordController.text != "12345678") {
      return;
    }

    callback(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Sign in',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LogoApp(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputField(
                      title: 'Email',
                      textHolder: 'example@email.com',
                      isPassword: false,
                      controller: _emailController,
                      validator: emailValidator,
                    
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputField(
                      title: 'Password',
                      textHolder: '********',
                      isPassword: true,
                      controller: _passwordController,
                      validator: passwordValidator,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  child: const Text('Forgot Password?'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ForgotPassWord.routeName);
                  },
                ),
              ),
              LargeButton(
                text: 'Login',
                handler: _saveForm,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Or continue with',
                  style: TextStyle(color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  MyIconButton(
                    imageURI: 'assets/images/facebook_icon.png',
                  ),
                  MyIconButton(
                    imageURI: 'assets/images/google_icon.png',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have account? '),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Signup.routeName);
                    },
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
