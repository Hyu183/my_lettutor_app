import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/schedule.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';

import 'package:my_lettutor_app/ui/booking/booking_modal_layout.dart';
import 'package:my_lettutor_app/ui/booking/time_grid.dart';
import 'package:my_lettutor_app/utils/utils.dart';
import 'package:my_lettutor_app/widgets/button/large_button.dart';

import 'package:my_lettutor_app/data/data.dart';
import 'package:provider/src/provider.dart';

class BookingModal extends StatefulWidget {
  final String tutorId;
  const BookingModal({Key? key, required this.tutorId}) : super(key: key);

  @override
  State<BookingModal> createState() => _BookingModalState();
}

class _BookingModalState extends State<BookingModal> {
  Map<int, List<Schedule>> _groupedSchedules = {};
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSchedule();
  }

  void loadSchedule() async {
    var dio = DioClient.dio;
    var accessToken =
        context.read<AuthProvider>().userToken.tokens!.access!.token!;

    dio.options.headers["Authorization"] = "Bearer $accessToken";
    try {
      var res = await dio.post('/schedule', data: {'tutorId': widget.tutorId});

      Iterable rawResponse = res.data['data'];

      var now = DateTime.now();

      List<Schedule> filteredSchedules = rawResponse
          .where(
              (e) => Utils.checkScheduleWithin7Days(e['startTimestamp'], now))
          .map((schedule) => Schedule.fromJson(schedule))
          .toList();

      var groupByDaySchedules = groupBy(filteredSchedules, (Schedule schedule) {
        return 
           Utils.getDate(schedule.startTimestamp!).millisecondsSinceEpoch ;
      });
      
      if (!mounted) return;
      setState(() {
        _groupedSchedules = groupByDaySchedules;
        isLoading = false;
      });
    } on DioError catch (e) {
      print(e);
      print(e.response!.data['message']);
    }
  }

  void _startTimeGrid(BuildContext ctx, List<Schedule> schedules) {
    showModalBottomSheet(
        context: ctx,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        builder: (_) {
          return BookingModalLayout(
            child: TimeGrid(key: ValueKey(schedules), schedules: schedules),
          );
        });
  }

  @override
  Widget build(BuildContext context) {

var sortedKeys = _groupedSchedules.keys.sorted((a,b)=>a.compareTo(b));
    return BookingModalLayout(
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).textTheme.headline2!.color,
                backgroundColor: Colors.white,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              itemCount: _groupedSchedules.length,
              itemBuilder: (_, index) {
                int day = sortedKeys[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: LargeButton(
                    text: DateFormat('dd-MM-yyyy').format(Utils.getDate(day))  ,
                    handler: () =>
                        _startTimeGrid(context, _groupedSchedules[day]!),
                  ),
                );
              },
            ),
    );
  }
}
