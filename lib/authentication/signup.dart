import 'package:flutter/material.dart';
import 'package:my_lettutor_app/widgets/my_icon_button.dart';

import '../widgets/input_field.dart';
import '../widgets/large_button.dart';
// import 'login.dart';

class Signup extends StatelessWidget {
  static const routeName = '/sign-up';
  Signup({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? nameValidator(String? name) {
    if (name != null) {
      if (name.isEmpty) {
        return 'Fullname cannot be empty';
      }
      return null;
    }
    return null;
  }

  String? emailValidator(String? email) {
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

  String? confirmPasswordValidator(String? password) {
    if (password != null) {
      if (password.isEmpty) {
        return 'Confirm Password cannot be empty';
      } else if (password != _passwordController.text) {
        return 'Confirm Password does not match';
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
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputField(
                      title: 'Fullname',
                      textHolder: 'Name',
                      isPassword: false,
                      controller: _nameController,
                      validator: nameValidator,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    InputField(
                      title: 'Confirm password',
                      textHolder: '********',
                      isPassword: true,
                      controller: null,
                      validator: confirmPasswordValidator,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              LargeButton(
                text: 'Register',
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
                  const Text('Already have an account? '),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Log In'),
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
