import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/tutor.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:my_lettutor_app/utils/utils.dart';
// import 'package:my_lettutor_app/providers/favorite_teachers.dart';
import 'package:provider/provider.dart';

import 'package:my_lettutor_app/ui/pages/profile_page.dart';
import 'package:my_lettutor_app/ui/tutor/tutor_card.dart';
import 'package:my_lettutor_app/providers/teachers.dart';

// import 'package:my_lettutor_app/data/data.dart';

class HomePage extends StatefulWidget {
  final void Function(int) navigatorFunc;
  const HomePage({
    Key? key,
    required this.navigatorFunc,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoadingTotalTime = true;
  bool isLoadingTutorList = true;
  List<Tutor> tutorList = [];
  List<int> totalTime = [];
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  void getData() {
    var dio = DioClient.dio;
    var accessToken = "";
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      accessToken =
          context.read<AuthProvider>().userToken.tokens!.access!.token!;
      //   print(accessToken);
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      try {
        var totalTimeRes = await getTotalTime(dio);
        var tutorRes = await getTutorList(dio);

        setState(() {
          tutorList = tutorRes;
          isLoadingTotalTime = false;
          isLoadingTutorList = false;
          totalTime = Utils.getTotalTime(1859); //totalTimeRes
        });
      } on DioError catch (e) {
        print(e);
        print(e.response!.data['message']);
        print(e.requestOptions.headers["Authorization"]);
      }
    });
  }

  Future<int> getTotalTime(Dio dio) async {
    var res = await dio.get('/call/total');
    return res.data["total"];
  }

  Future<List<Tutor>> getTutorList(Dio dio) async {
    var queryParams = {'perPage': 9, 'page': 1};

    var res = await dio.get('/tutor/more', queryParameters: queryParams);

    Iterable rawTutors = res.data["tutors"]["rows"];

    var result = await Future.wait(rawTutors.map((tutor) async {
      var tutorRes = await dio.get('/tutor/${tutor['userId']}');
      return Tutor.fromJson(tutorRes.data);
    }));

    return result;
  }

  void reloadTutorList(Dio dio, String accessToken) async {
    setState(() {
      isLoadingTutorList = true;
    });
    dio.options.headers["Authorization"] = "Bearer $accessToken";
    var queryParams = {'perPage': 9, 'page': 1};

    var res = await dio.get('/tutor/more', queryParameters: queryParams);

    Iterable rawTutors = res.data["tutors"]["rows"];

    var result = await Future.wait(rawTutors.map((tutor) async {
      var tutorRes = await dio.get('/tutor/${tutor['userId']}');
      return Tutor.fromJson(tutorRes.data);
    }));

    setState(() {
      tutorList = result;
      isLoadingTutorList = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
    final userAvatarUrl = context.read<AuthProvider>().userToken.user!.avatar;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          translator.homeTitle,
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ProfilePage.routeName);
              },
              icon: CircleAvatar(
                radius: 60,
                backgroundImage: userAvatarUrl !=
                        "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png"
                    ? ResizeImage(
                        NetworkImage(
                          userAvatarUrl!,
                        ),
                        height: 60,
                        width: 60,
                      )
                    : const ResizeImage(
                        AssetImage(
                          'assets/images/user.png',
                        ),
                        height: 60,
                        width: 60,
                      ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Theme.of(context)
                  .textTheme
                  .headline2!
                  .color!
                  .withOpacity(0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    isLoadingTotalTime
                        ? translator.welcomeText
                        : translator.totalTime(totalTime[0], totalTime[1]),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget
                          .navigatorFunc(3); //Navigate to Tutors page: index 3
                    },
                    child: Text(translator.bookLessonBtn,
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.headline2!.color!)),
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                    child: Text(translator.recommendedTutors,
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  TextButton(
                    onPressed: () {
                      widget
                          .navigatorFunc(3); //Navigate to Tutors page: index 3
                    },
                    child: Row(
                      children: [
                        Text(translator.seeAllLink),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            isLoadingTutorList
                ? CircularProgressIndicator(
                    backgroundColor:
                        Theme.of(context).textTheme.headline2!.color,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: tutorList.map((tutor) {
                        return TutorCard(
                          tutor: tutor,
                          version: 1,
                          reloadTutorList: reloadTutorList,
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
