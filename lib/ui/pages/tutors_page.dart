import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/constants/variables.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/tutor.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:my_lettutor_app/utils/stop_typing_checker.dart';
// import 'package:my_lettutor_app/providers/favorite_teachers.dart';
// import 'package:my_lettutor_app/providers/teachers.dart';
import 'package:my_lettutor_app/widgets/badge/my_badge.dart';
import 'package:my_lettutor_app/widgets/no_data.dart';
import 'package:provider/provider.dart';

import 'package:my_lettutor_app/ui/tutor/tutor_card.dart';
// import 'package:my_lettutor_app/widgets/badge/my_badge_list.dart';
// import 'package:my_lettutor_app/widgets/search_bar.dart';

// import 'package:my_lettutor_app/data/data.dart' show specialities;

class TutorsPage extends StatefulWidget {
  static const routeName = '/tutors';
  const TutorsPage({Key? key}) : super(key: key);

  @override
  State<TutorsPage> createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  var selectedSpecialityFilter = "";
  List<Tutor> tutors = [];
  bool isLoading = true;
  bool isLoadingMore = false;
  int currentPage = 1;
  int perPage = 3;
  int countTotal = 0;
  final _scrollController = ScrollController();
  final _searchTextController = TextEditingController(text: "");
  final stopTypingChecker = StopTypingChecker(milliseconds: 800);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(scrollListener);
    getTutorList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        isLoadingMore == false) {
      print("OK");

      if (tutors.length < countTotal) {
        setState(() {
          isLoadingMore = true;
        });
        currentPage += 1;
        getTutorList();
      }
    }
  }

  void _onTapSpecialityHandler(String slug) {
    if (isLoading) return;
    setState(() {
      selectedSpecialityFilter = slug;
      isLoading = true;
      tutors = [];
      currentPage = 1;
    });
    getTutorList();
  }

  void _searchTutorNameHandler() {
    setState(() {
      isLoading = true;
      tutors = [];
      currentPage = 1;
    });
    getTutorList();
  }

  void getTutorList() {
    var dio = DioClient.dio;

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      var accessToken =
          context.read<AuthProvider>().userToken.tokens!.access!.token!;

      dio.options.headers["Authorization"] = "Bearer $accessToken";
      try {
        var data = {
          'perPage': perPage,
          'page': currentPage,
          'filters': {
            'specialties': [selectedSpecialityFilter]
          },
          'search': _searchTextController.value.text
        };

        print(data);

        var response = await dio.post('/tutor/search', data: data);

        Iterable rawTutors = response.data["rows"];

        var tutorList = await Future.wait(rawTutors.map((tutor) async {
          var res = await dio.get('/tutor/${tutor['userId']}');
          return Tutor.fromJson(res.data);
        }));
        if (!mounted) return;
        setState(() {
          tutors = isLoadingMore ? (tutors..addAll(tutorList)) : tutorList;
          isLoading = false;
          isLoadingMore = false;
          countTotal = response.data["count"];
        });
      } on DioError catch (e) {
        print(e);
      }
    });
  }

  Future _onRefresh() {
    setState(() {
      _searchTextController.text = "";
      currentPage = 1;
      selectedSpecialityFilter = "";
      isLoading = true;
      tutors = [];
    });
    return Future.delayed(Duration.zero, getTutorList);
  }

  void reloadFavoriteTutorList() async {
    setState(() {
      isLoading = true;
    });   
    var dio = DioClient.dio;
    var accessToken =
        context.read<AuthProvider>().userToken.tokens!.access!.token!;
    dio.options.headers["Authorization"] = "Bearer $accessToken";
    var queryParams = {'perPage': 9, 'page': 1};

    var res = await dio.get('/tutor/more', queryParameters: queryParams);

    Iterable rawTutors = res.data["favoriteTutor"];
    
    var favoritedTutorId = rawTutors.map((e) => e['secondId']);
    var tempTutorList = tutors.toList();

    for (int i = 0; i < tempTutorList.length; ++i) {
      if (favoritedTutorId.contains(tempTutorList[i].userId)) {
        tempTutorList[i].isFavorite = true;
      } else {
        tempTutorList[i].isFavorite = false;
      }
    } 

    setState(() {
      tutors = tempTutorList;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          translator.tutorsTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: CupertinoSearchTextField(
                placeholder: translator.searchTutorPlaceholder,
                backgroundColor: Colors.grey[200],
                onChanged: (_) =>
                    stopTypingChecker.run(_searchTutorNameHandler),
                controller: _searchTextController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: specialtiesMap.length,
                itemBuilder: (_, index) {
                  String slugKey = specialtiesMap.keys.elementAt(index);
                  return MyBadge(
                    data: specialtiesMap[slugKey]!,
                    isSelected: selectedSpecialityFilter == slugKey,
                    index: index,
                    onTapHandler: () => _onTapSpecialityHandler(slugKey),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : tutors.isEmpty
                      ? const NoData()
                      : RefreshIndicator(
                          onRefresh: _onRefresh,
                          child: ListView.builder(
                            controller: _scrollController,
                            clipBehavior: Clip.hardEdge,
                            //   physics: const BouncingScrollPhysics(
                            //       parent: AlwaysScrollableScrollPhysics()),
                            //   dragStartBehavior: DragStartBehavior.start,
                            //   primary: false,
                            itemCount: tutors.length + 1,
                            itemBuilder: (_, index) {
                              if (index == tutors.length) {
                                return isLoadingMore
                                    ? const Center(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      )
                                    : Container();
                                //   Center(
                                //       child: Text(translator.noMoreData),
                                //     );
                              }
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: TutorCard(
                                  key: ValueKey(tutors[index].id),
                                  tutor: tutors[index],
                                  version: 2,
                                  reloadTutorList: reloadFavoriteTutorList,
                                ),
                              );
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
