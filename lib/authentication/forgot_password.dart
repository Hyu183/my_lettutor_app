import 'package:flutter/material.dart';

import '../widgets/large_button.dart';
import '../widgets/logo_app.dart';

class ForgotPassWord extends StatelessWidget {
  static const routeName = 'forgot-password';
  ForgotPassWord({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    print(_emailController.text);
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LogoApp(),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Enter your email address and we\'ll send you a link to reset your password',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: (val) {
                    if (val != null) {
                      if (val.isEmpty || !val.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    icon: Icon(
                      Icons.mail,
                      color: Color(0XFF0071F0),
                      size: 40,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              LargeButton(
                text: 'Send',
                handler: _saveForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
