import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_lettutor_app/constants/variables.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/user.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:my_lettutor_app/utils/utils.dart';
import 'package:my_lettutor_app/widgets/input/birthday_input.dart';
import 'package:my_lettutor_app/widgets/input/drop_down_input.dart';
import 'package:my_lettutor_app/widgets/input/phone_input.dart';
import 'package:my_lettutor_app/ui/profile/profile_avatar.dart';
import 'package:my_lettutor_app/widgets/button/large_button.dart';

import 'package:my_lettutor_app/data/data.dart';
// import 'package:my_lettutor_app/models/temp/user.dart';
import 'package:provider/src/provider.dart';

// final User user = User(name: 'Huy', email: 'Email@gmail.com');

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User user;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  late DateTime _selectedDate;
  late String _selectedCountry;
  final _phoneController = TextEditingController();
//   var _selectedLevel = 'Beginner';
//   var _selectedWannaLearn = 'TOEIC';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = context.read<AuthProvider>().userToken.user!;
    _nameController.text = user.name!;
    _phoneController.text = user.phone!;
    _selectedCountry =
        codeToCountryMap[user.country!] == null ? 'VN' : user.country!;
    _selectedDate = Utils.getBirthDay(user.birthday!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

 
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

  void _showSnackBar(String text, Color color) {
    Get.snackbar(
      text,
      '',
      colorText: Colors.white,
      backgroundColor: color,
      duration: const Duration(seconds: 1),
      leftBarIndicatorColor: Colors.white,
      borderRadius: 10,
    );
  }

  void _saveForm(BuildContext context) async {
    EasyLoading.show();
    var dio = DioClient.dio;
    var accessToken =
        context.read<AuthProvider>().userToken.tokens!.access!.token!;
    dio.options.headers['Authorization'] = "Bearer ${accessToken}";
    try {
      var response = await dio.put(
        '/user/info',
        data: {
          "name": _nameController.text,
          "country": _selectedCountry,
          "phone": _phoneController.text,
          "birthday": DateFormat('yyyy-MM-dd').format(_selectedDate),
        },
      );
      User use = User.fromJson(response.data['user']);

      context.read<AuthProvider>().user = use;
      _showSnackBar(AppLocalizations.of(context)!.updateProfile, Colors.green);
      EasyLoading.dismiss();
      Navigator.of(context).pop();
    } on DioError catch (e) {
      EasyLoading.dismiss();
      print(e);
      _showSnackBar(AppLocalizations.of(context)!.error, Colors.red);
    }
  }

//   void setDropdownLevel(String? newVal) {
//     setState(() {
//       _selectedLevel = newVal!;
//     });
//   }

//   void setDropdownWannaLearn(String? newVal) {
//     setState(() {
//       _selectedWannaLearn = newVal!;
//     });
//   }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          translator.profileTitle,
          style: const TextStyle(
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
                    ProfileAvatar(userAvatarUrl: user.avatar!),
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
                      user.email!,
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
                  PhoneInput(controller: _phoneController),
                  DropdownInput(
                    title: translator.countryLabel,
                    list: codeToCountryMap.keys.toList(),
                    selectedValue: _selectedCountry,
                    callback: setDropdownCountry,
                  ),
                  //   DropdownInput(
                  //     title: translator.myLevelLabel,
                  //     list: ['Beginner', 'Intermediate', 'Advanced'],
                  //     selectedValue: _selectedLevel,
                  //     callback: setDropdownLevel,
                  //   ),
                  //   DropdownInput(
                  //     title: translator.wantToLearnLabel,
                  //     list: specialities,
                  //     selectedValue: _selectedWannaLearn,
                  //     callback: setDropdownWannaLearn,
                  //   ),
                  LargeButton(
                      text: translator.saveBtn,
                      handler: () {
                        _saveForm(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
