import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/widgets/input/birthday_input.dart';
import 'package:my_lettutor_app/widgets/input/drop_down_input.dart';
import 'package:my_lettutor_app/widgets/input/phone_input.dart';
import 'package:my_lettutor_app/ui/profile/profile_avatar.dart';
import 'package:my_lettutor_app/widgets/button/large_button.dart';

import 'package:my_lettutor_app/data/data.dart';
import 'package:my_lettutor_app/models/temp/user.dart';

final User user = User(name: 'Huy', email: 'Email@gmail.com');

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: user.name);

  var _selectedDate = DateTime.now();
  var _selectedCountry = 'Vietnam';
  var _selectedLevel = 'Beginner';
  var _selectedWannaLearn = 'TOEIC';

  void _startDatePicker(BuildContext ctx) {
    showDatePicker(
            context: ctx,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((datePicked) {
      if (datePicked == null) {
        return;
      }
      setState(() {
        _selectedDate = datePicked;
      });
    });
  }

  void setDropdownCountry(String? newVal) {
    setState(() {
      _selectedCountry = newVal!;
    });
  }

  void setDropdownLevel(String? newVal) {
    setState(() {
      _selectedLevel = newVal!;
    });
  }

  void setDropdownWannaLearn(String? newVal) {
    setState(() {
      _selectedWannaLearn = newVal!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text(
          AppLocalizations.of(context)!.profileTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const ProfileAvatar(),
                    Theme(
                      data: ThemeData(),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.grey),
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      user.email,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BirthdayInput(
                    ctx: context,
                    startDatePicker: _startDatePicker,
                    datetime: _selectedDate,
                  ),
                  const PhoneInput(),
                  DropdownInput(
                    title: AppLocalizations.of(context)!.countryLabel,
                    list: countryList,
                    selectedValue: _selectedCountry,
                    callback: setDropdownCountry,
                  ),
                  DropdownInput(
                    title: AppLocalizations.of(context)!.myLevelLabel,
                    list: ['Beginner', 'Intermediate', 'Advanced'],
                    selectedValue: _selectedLevel,
                    callback: setDropdownLevel,
                  ),
                  DropdownInput(
                    title: AppLocalizations.of(context)!.wantToLearnLabel,
                    list: specialities,
                    selectedValue: _selectedWannaLearn,
                    callback: setDropdownWannaLearn,
                  ),
                  LargeButton(text: AppLocalizations.of(context)!.saveBtn, handler: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}