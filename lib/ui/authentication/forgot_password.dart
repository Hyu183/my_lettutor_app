import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';

import 'package:my_lettutor_app/widgets/button/large_button.dart';
import 'package:my_lettutor_app/widgets/logo_app.dart';

class ForgotPassWord extends StatelessWidget {
  static const routeName = 'forgot-password';
  ForgotPassWord({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _saveForm(BuildContext context) async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    var dio = DioClient.dio;
    print(_emailController.text);
    try {
      var res = await dio.post(
        '/user/forgotPassword',
        data: {'email': _emailController.text},
      );
      
        Navigator.of(context).pop();

    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.forgotPassword,
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
              Text(
                AppLocalizations.of(context)!.forgetPasswordDescription,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _emailController,
                  validator: (val) {
                    if (val != null) {
                      if (val.isEmpty || !val.contains('@')) {
                        return AppLocalizations.of(context)!.emailErrText;
                      }
                      return null;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.forgetPasswordPlaceholder,
                    icon: Icon(
                      Icons.mail,
                      color: Theme.of(context).textTheme.headline2!.color!,
                      size: 40,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
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
                text: AppLocalizations.of(context)!.sendBtn,
                handler: () => _saveForm(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
