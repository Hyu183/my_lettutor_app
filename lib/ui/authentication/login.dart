import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/ui/authentication/forgot_password.dart';
import 'package:my_lettutor_app/ui/authentication/signup.dart';
import 'package:my_lettutor_app/widgets/button/large_button.dart';
import 'package:my_lettutor_app/widgets/button/my_icon_button.dart';
import 'package:my_lettutor_app/widgets/input/input_field.dart';
import 'package:my_lettutor_app/widgets/logo_app.dart';

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

  String? emailValidator(String? email, BuildContext context){
    print(email);
    if (email != null) {
      if (email.isEmpty) {
        return AppLocalizations.of(context)!.emptyEmailErrText;
      } else if (!email.contains('@')) {
        return  AppLocalizations.of(context)!.emailErrText;
      }
      return null;
    }
    return null;
  }

  String? passwordValidator(String? password, BuildContext context) {
    print(password);
    if (password != null) {
      if (password.isEmpty) {
        return AppLocalizations.of(context)!.emptyPasswordErrText;
      } else if (password.length < 8) {
        return AppLocalizations.of(context)!.passwordErrText;
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
          AppLocalizations.of(context)!.signIn,
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
                      title: AppLocalizations.of(context)!.emailLabel,
                      textHolder: 'example@email.com',
                      isPassword: false,
                      controller: _emailController,
                      validator:(val)=> emailValidator(val,context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputField(
                      title: AppLocalizations.of(context)!.passwordLabel,
                      textHolder: '********',
                      isPassword: true,
                      controller: _passwordController,
                      validator:(val)=> passwordValidator(val, context),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  child: Text(AppLocalizations.of(context)!.forgotPasswordLink),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ForgotPassWord.routeName);
                  },
                ),
              ),
              LargeButton(
                text: AppLocalizations.of(context)!.loginBtn,
                handler: _saveForm,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.orContinueWith,
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
                  Text(AppLocalizations.of(context)!.dontHaveAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Signup.routeName);
                    },
                    child: Text(AppLocalizations.of(context)!.signUp),
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
