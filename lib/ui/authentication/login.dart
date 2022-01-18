import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/user.dart';
import 'package:my_lettutor_app/models/user_token.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:my_lettutor_app/ui/authentication/forgot_password.dart';
import 'package:my_lettutor_app/ui/authentication/signup.dart';
import 'package:my_lettutor_app/widgets/button/large_button.dart';
import 'package:my_lettutor_app/widgets/button/my_icon_button.dart';
import 'package:my_lettutor_app/widgets/input/input_field.dart';
import 'package:my_lettutor_app/widgets/logo_app.dart';
import 'package:provider/src/provider.dart';

class Login extends StatelessWidget {
  static const routeName = '/login';

  Login({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  //'neyzik123@gmail.com'
  final _emailController = TextEditingController(text: 'neyzik123@gmail.com');
  final _passwordController = TextEditingController(text: '123456');

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
      } else if (password.length < 6) {
        return AppLocalizations.of(context)!.passwordErrText;
      }
      return null;
    }
    return null;
  }

  void _showSnackBar(String text) {
    Get.snackbar(
      text,
      '',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 1),
      leftBarIndicatorColor: Colors.white,
      borderRadius: 10,
    );
  }

  void _saveForm(BuildContext context) async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    EasyLoading.show();
    var dio = DioClient.dio;

    try {
      var response = await dio.post(
        '/auth/login',
        data: {
          'email': _emailController.text,
          'password': _passwordController.text
        },
      );
      UserToken userToken = UserToken.fromJson(response.data);
      dio.options.headers['Authorization'] = "Bearer ${userToken.tokens!.access!.token!}"; 
      var userInfoResponse = await dio.get('/user/info');

      userToken.user = User.fromJson(userInfoResponse.data['user']);

      context.read<AuthProvider>().logIn(userToken, true);
      EasyLoading.dismiss();
    } on DioError catch (e) {
      EasyLoading.dismiss();
      print(e);
      if (e.response != null) {
        _showSnackBar(AppLocalizations.of(context)!.wrongLogInInfo);
      } else {
        print("Dont know");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          translator.signIn,
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
                      title: translator.emailLabel,
                      textHolder: 'example@email.com',
                      isPassword: false,
                      controller: _emailController,
                      validator: (val) => emailValidator(val, context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputField(
                      title: translator.passwordLabel,
                      textHolder: '********',
                      isPassword: true,
                      controller: _passwordController,
                      validator: (val) => passwordValidator(val, context),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  child: Text(translator.forgotPasswordLink),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ForgotPassWord.routeName);
                  },
                ),
              ),
              LargeButton(
                text: translator.loginBtn,
                handler: () => _saveForm(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(translator.orContinueWith,
                  style: const TextStyle(color: Colors.grey)),
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
                  Text(translator.dontHaveAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Signup.routeName);
                    },
                    child: Text(translator.signUp),
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
