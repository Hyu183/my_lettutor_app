import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PhoneInput extends StatelessWidget {
  final TextEditingController controller;
  const PhoneInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          AppLocalizations.of(context)!.phoneNumberLabel,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 20,
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Theme(
            data: ThemeData(),
            child: TextFormField(
                controller:controller,
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.all(0),
                hintText: AppLocalizations.of(context)!.phoneNumberPlaceholder,
                border: InputBorder.none,
              ),
              keyboardType: const TextInputType.numberWithOptions(),
            ),
          ),
        ),
      ],
    );
  }
}
