import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/user_schedule.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:my_lettutor_app/ui/schedule/schedule_card.dart';

import 'package:my_lettutor_app/data/data.dart';
import 'package:my_lettutor_app/widgets/no_data.dart';
import 'package:provider/src/provider.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  ScrollController _scrollController = ScrollController();
  List<UserSchedule> userSchedules = [];
  bool isLoading = true;
  bool isCancelling = false;
  int currentPage = 1;
  final int perPage = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserSchedules();
  }

  void getUserSchedules() {
    var dio = DioClient.dio;

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      var accessToken =
          context.read<AuthProvider>().userToken.tokens!.access!.token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var query = {
        'page': currentPage,
        'perPage': perPage,
        'dateTimeGte': DateTime.now().millisecondsSinceEpoch,
        'orderBy': 'meeting',
        'sortBy': 'asc'
      };
      try {
        var res =
            await dio.get('/booking/list/student', queryParameters: query);

        Iterable rawRes = res.data["data"]["rows"];

        List<UserSchedule> result = rawRes
            .map((userSchedule) => UserSchedule.fromJson(userSchedule))
            .toList();
        if (!mounted) return;
        setState(() {
          userSchedules = result;
          isLoading = false;
        });
      } on DioError catch (e) {
        print(e.response!.data);
      }
    });
  }

  void triggerLoadingCancelling() {
    setState(() {
      isCancelling = !isCancelling;
    });
  }

  void onCancelScheduleHandler(String scheduleDetailId) {
    setState(() {
      userSchedules = userSchedules
          .where((userSchedule) =>
              userSchedule.scheduleDetailId != scheduleDetailId)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          translator.upcomingTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20,
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).textTheme.headline2!.color,
                  backgroundColor: Colors.white,
                ),
              )
            : userSchedules.isEmpty
                ? const Center(child: NoData())
                : ListView.builder(
                    // controller: _scrollController,
                    itemCount: userSchedules.length,
                    itemBuilder: (_, i) {
                      return ScheduleCard(
                        key: ValueKey(userSchedules[i].id),
                        userSchedule: userSchedules[i],
                        onCancel: onCancelScheduleHandler,
                      );
                    },
                  ),
      ),
    );
  }
}
