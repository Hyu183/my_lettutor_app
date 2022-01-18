import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/user_schedule.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';

import 'package:my_lettutor_app/ui/settings/session_history_card.dart';

import 'package:my_lettutor_app/data/data.dart';
import 'package:my_lettutor_app/widgets/no_data.dart';
import 'package:provider/src/provider.dart';

class SessionHistory extends StatefulWidget {
  static const String routeName = 'session-history';
  const SessionHistory({Key? key}) : super(key: key);

  @override
  State<SessionHistory> createState() => _SessionHistoryState();
}

class _SessionHistoryState extends State<SessionHistory> {
  final _scrollController = ScrollController();
  List<UserSchedule> userSchedules = [];
  bool isLoading = true;
  bool isLoadingMore = false;
  int currentPage = 1;
  final int perPage = 10;
  int countTotal = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(scrollListener);
    getUserSchedules();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        isLoadingMore == false) {
      if (userSchedules.length < countTotal) {
        setState(() {
          isLoadingMore = true;
        });
        currentPage += 1;
        getUserSchedules();
      } else {
        showSnackbarNoMoreData();
      }
    }
  }

  void showSnackbarNoMoreData() {
    Get.closeAllSnackbars();
    Get.snackbar(
      AppLocalizations.of(context)!.noMoreData, '',
      colorText: Colors.black,
      animationDuration: const Duration(milliseconds: 200),
      // backgroundColor: Colors.red,
      duration: const Duration(milliseconds: 600),
      snackPosition: SnackPosition.BOTTOM,
    );
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
        'dateTimeGte': DateTime.now()
            .subtract(const Duration(minutes: 35))
            .millisecondsSinceEpoch,
        'orderBy': 'meeting',
        'sortBy': 'desc'
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
          countTotal = res.data["data"]['count'];
        });
      } on DioError catch (e) {
        print(e.response!.data);
      }
    });
  }

  Future _onRefresh() {
    setState(() {
      currentPage = 1;
      isLoading = true;
      userSchedules = [];
    });
    return Future.delayed(Duration.zero, getUserSchedules);
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          translator.sessionHistoryTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).textTheme.headline2!.color,
                  backgroundColor: Colors.white,
                ),
              )
            : userSchedules.isEmpty
                ? const Center(child: NoData())
                : RefreshIndicator(
                    onRefresh: _onRefresh,
                    color: Theme.of(context).textTheme.headline2!.color,
                    backgroundColor: Colors.white,
                    child: ListView.builder(
                      controller: _scrollController,
                      clipBehavior: Clip.hardEdge,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: userSchedules.length + 1,
                      itemBuilder: (_, i) {
                        if (i == userSchedules.length) {
                          return isLoadingMore
                              ? Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .color,
                                      backgroundColor: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                )
                              : Container();
                        }
                        return SessionHistoryCard(
                          key: ValueKey(userSchedules[i].id),
                          session: userSchedules[i],
                        );
                      },
                    ),
                  ),

        //     :  Column(
        //   children:
        //       sessions.map((e) => SessionHistoryCard(session: e)).toList(),
        // ),
      ),
    );
  }
}
