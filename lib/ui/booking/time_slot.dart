import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/schedule.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:provider/src/provider.dart';

class TimeSlot extends StatefulWidget {
  final Schedule schedule;

  const TimeSlot({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  @override
  State<TimeSlot> createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  bool bookSuccess = false;

  void _showConfirmBookClass(
      BuildContext context, String startTime, String endTime) {
    // Get.dialog(Container(child: Text('hehehe'))
    // );
    final translator = AppLocalizations.of(context)!;
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(translator.confirmBook,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('${translator.time}: $startTime - $endTime'),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text(translator.noCancelContentTextDialog)),
                        TextButton(
                            onPressed: () {
                              bookClass(ctx);
                              Navigator.of(ctx).pop();
                            },
                            child: Text(translator.yesCancelContentTextDialog)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void bookClass(BuildContext context) async {
    EasyLoading.show();
    final translator = AppLocalizations.of(context)!;
    var dio = DioClient.dio;
    var accessToken =
        context.read<AuthProvider>().userToken.tokens!.access!.token!;
    dio.options.headers["Authorization"] = "Bearer $accessToken";
    var data = {
      'scheduleDetailIds': [widget.schedule.scheduleDetails![0].id],
      'note': ''
    };
    try {
      await dio.post('/booking', data: data);
      _showSnackBar(translator.bookSuccess, Colors.green);
      setState(() {
        bookSuccess = true;
      });
      EasyLoading.dismiss();
    } on DioError catch (e) {
      var statusCode = e.response!.data['statusCode'];

      if (statusCode == 11) {
        _showSnackBar(translator.bookExist, Colors.red);
      } else if (statusCode == 15) {
        _showSnackBar(translator.noMoney, Colors.red);
      } else {
        _showSnackBar(translator.error, Colors.red);
      }
      EasyLoading.dismiss();
    }
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

  @override
  Widget build(BuildContext context) {
    String startTime = DateFormat('HH:mm').format(
        DateTime.fromMillisecondsSinceEpoch(widget.schedule.startTimestamp!)
            .toLocal());
    String endTime = DateFormat('HH:mm').format(
        DateTime.fromMillisecondsSinceEpoch(widget.schedule.endTimestamp!)
            .toLocal());

    return widget.schedule.isBooked!
        ? ElevatedButton(
            onPressed: null,
            child: Text(
              startTime + ' - ' + endTime,
            ),
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.grey[400],
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    Colors.white70,
                  ),
                ),
          )
        : bookSuccess
            ? OutlinedButton(
                onPressed: () {},
                child: Text(
                  startTime + ' - ' + endTime,
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.green,
                  side: const BorderSide(color: Colors.green),
                ),
              )
            : OutlinedButton(
                onPressed: () =>
                    _showConfirmBookClass(context, startTime, endTime),
                child: Text(
                  startTime + ' - ' + endTime,
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                ),
              );
  }
}
