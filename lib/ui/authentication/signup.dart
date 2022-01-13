import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/widgets/button/large_button.dart';
import 'package:my_lettutor_app/widgets/button/my_icon_button.dart';
import 'package:my_lettutor_app/widgets/input/input_field.dart';

class Signup extends StatelessWidget {
  static const routeName = '/sign-up';
  Signup({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? nameValidator(String? name, BuildContext context) {
    if (name != null) {
      if (name.isEmpty) {
        return AppLocalizations.of(context)!.emptyFullNameErrText;
      }
      return null;
    }
    return null;
  }

  String? emailValidator(String? email, BuildContext context) {
    if (email != null) {
      if (email.isEmpty) {
        return AppLocalizations.of(context)!.emptyEmailErrText;
      } else if (!email.contains('@')) {
        return AppLocalizations.of(context)!.emailErrText;
      }
      return null;
    }
    return null;
  }

  String? passwordValidator(String? password, BuildContext context) {
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

  String? confirmPasswordValidator(String? password, BuildContext context) {
    if (password != null) {
      if (password.isEmpty) {
        return AppLocalizations.of(context)!.emptyConfirmPasswordErrText;
      } else if (password != _passwordController.text) {
        return AppLocalizations.of(context)!.confirmPasswordErrText;
      }
      return null;
    }
    return null;
  }

  void _saveForm(BuildContext context) async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    var dio = DioClient.dio;
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      var res = await dio.post(
        '/auth/register',
        data: {
          'email': _emailController.text,
          'password': _passwordController.text
        },
      );
      Navigator.of(context).pop();
      // callback(1);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.signUp,
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
                    // InputField(
                    //   title: AppLocalizations.of(context)!.fullNameLabel,
                    //   textHolder: AppLocalizations.of(context)!.fullNamePlaceholder,
                    //   isPassword: false,
                    //   controller: _nameController,
                    //   validator:(val)=> nameValidator(val,context),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    InputField(
                      title: AppLocalizations.of(context)!.emailLabel,
                      textHolder: 'example@email.com',
                      isPassword: false,
                      controller: _emailController,
                      validator: (val) => emailValidator(val, context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputField(
                      title: AppLocalizations.of(context)!.passwordLabel,
                      textHolder: '********',
                      isPassword: true,
                      controller: _passwordController,
                      validator: (val) => passwordValidator(val, context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputField(
                      title: AppLocalizations.of(context)!.confirmPasswordLabel,
                      textHolder: '********',
                      isPassword: true,
                      controller: null,
                      validator: (val) =>
                          confirmPasswordValidator(val, context),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              LargeButton(
                text: AppLocalizations.of(context)!.registerBtn,
                handler: () => _saveForm(context),
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
                  Text(AppLocalizations.of(context)!.alreadyHaveAnAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(AppLocalizations.of(context)!.loginLink),
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
