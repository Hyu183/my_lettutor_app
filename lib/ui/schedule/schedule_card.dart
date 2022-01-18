import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/booking_info.dart';
import 'package:my_lettutor_app/models/user_schedule.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:my_lettutor_app/ui/meetings/meeting.dart';

import 'package:my_lettutor_app/ui/schedule/schedule_tile.dart';
import 'package:my_lettutor_app/utils/utils.dart';
import 'package:my_lettutor_app/widgets/button/group_button.dart';
import 'package:provider/src/provider.dart';

// import 'package:my_lettutor_app/models/temp/upcoming.dart';

class ScheduleCard extends StatelessWidget {
  final UserSchedule userSchedule;
  final Function(String) onCancel;

  const ScheduleCard({
    Key? key,
    required this.userSchedule,
    required this.onCancel,
  }) : super(key: key);

  void showSnackBarCancelClassSuccess(BuildContext context) {
    Get.closeAllSnackbars();
    Get.snackbar(
      AppLocalizations.of(context)!.cancelClassSnackBar,
      '',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 1),
      leftBarIndicatorColor: Colors.white,
      borderRadius: 10,
    );
  }

  void showSnackBarCancelClassFail(BuildContext context) {
    Get.closeAllSnackbars();
    Get.snackbar(
      AppLocalizations.of(context)!.cancelClassSnackBarFail,
      '',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 1),
      leftBarIndicatorColor: Colors.white,
      borderRadius: 10,
    );
  }

  void confirmCancelHandler(BuildContext context) async {
    var dio = DioClient.dio;
    var accessToken =
        context.read<AuthProvider>().userToken.tokens!.access!.token;
    dio.options.headers["Authorization"] = "Bearer $accessToken";

    EasyLoading.show();
    try {
      await dio.delete('/booking', data: {
        'scheduleDetailIds': [userSchedule.scheduleDetailId]
      });
      onCancel(userSchedule.scheduleDetailId!);
      EasyLoading.dismiss();
      showSnackBarCancelClassSuccess(context);
    } catch (e) {
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
   
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ScheduleTile(
                  scheduleDetailInfo: userSchedule.scheduleDetailInfo!),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GroupButton(
                textLeft: translator.cancelBtn,
                textRight: translator.goToMeetingBtn,
                colorBackgroudLeft: Colors.white,
                colorTextLeft: Colors.grey,
                colorTopBorder: Colors.grey,
                handlerLeft: () {
                  if (Utils.checkValidCancelClass(
                      userSchedule.scheduleDetailInfo!.startPeriodTimestamp!)) {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              content: Text(translator.cancelContentTextDialog),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                        translator.noCancelContentTextDialog)),
                                TextButton(
                                    onPressed: () {
                                      confirmCancelHandler(context);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                        translator.yesCancelContentTextDialog)),
                              ],
                            ));
                  } else {
                    showSnackBarCancelClassFail(context);
                  }
                },
                handlerRight: () {
                  Navigator.of(context)
                      .pushNamed(Meeting.routeName, arguments: userSchedule);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
