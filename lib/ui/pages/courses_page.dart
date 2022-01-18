import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/course.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:my_lettutor_app/ui/course/course_card.dart';
import 'package:my_lettutor_app/ui/messages/message_list_tile.dart';
import 'package:my_lettutor_app/utils/stop_typing_checker.dart';
import 'package:my_lettutor_app/widgets/no_data.dart';
// import 'package:my_lettutor_app/widgets/search_bar.dart';

import 'package:my_lettutor_app/data/data.dart';
import 'package:provider/src/provider.dart';

class CoursePage extends StatefulWidget {
//   final List<Message>Course = '';
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  bool isLoading = true;
  bool isLoadingMore = false;
  List<Course> courses = [];
  int currentPage = 1;
  int perPage = 10;
  int countTotal = 0;

  final _scrollController = ScrollController();
  final _searchTextController = TextEditingController(text: "");
  final stopTypingChecker = StopTypingChecker(milliseconds: 800);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(scrollListener);
    getCourses();
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
      if (courses.length < countTotal) {
        setState(() {
          isLoadingMore = true;
        });
        currentPage += 1;
        getCourses();
      } else {
        showSnackbarNoMoreData();
      }
    }
  }

  void showSnackbarNoMoreData() {
    Get.closeAllSnackbars();
    Get.snackbar(
      AppLocalizations.of(context)!.noMoreData,
      '',
      colorText: Colors.black,
      animationDuration: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 600),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void getCourses() {
    var dio = DioClient.dio;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var accessToken =
          context.read<AuthProvider>().userToken.tokens!.access!.token!;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var query = {'page': currentPage, 'size': perPage};
      try {
        var response = await dio.get('/course', queryParameters: query);
        Iterable rawCourses = response.data['data']['rows'];

        var courseList =
            rawCourses.map((course) => Course.fromJson(course)).toList();

        setState(() {
          courses = isLoadingMore ? (courses..addAll(courseList)) : courseList;
          isLoading = false;
          isLoadingMore = false;
          countTotal = response.data['data']['count'];
        });
      } catch (e) {}
    });
  }

//   void _searchCourseHandler() {
//        setState(() {
//       isLoading = true;
//       courses = [];
//       currentPage = 1;
//     });
//     getCourses();
//   }

  Future _onRefresh() {
    setState(() {
      _searchTextController.text = "";
      currentPage = 1;
      isLoading = true;
      courses = [];
    });
    return Future.delayed(Duration.zero, getCourses);
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          translator.coursesTabLabel,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: CupertinoSearchTextField(
                placeholder: translator.searchCoursePlaceholder,
                backgroundColor: Colors.grey[200],
                // onChanged: (_) => stopTypingChecker.run(_searchCourseHandler),
                controller: _searchTextController,
              ),
            ),
            Expanded(
              child: messages.isNotEmpty
                  ? isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).textTheme.headline2!.color,
                            backgroundColor: Colors.white,
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: _onRefresh,
                          color: Theme.of(context).textTheme.headline2!.color,
                          backgroundColor: Colors.white,
                          child: ListView.builder(
                            controller: _scrollController,
                            clipBehavior: Clip.hardEdge,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemCount: courses.length + 1,
                            itemBuilder: (_, i) {
                              if (i == courses.length) {
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
                              return CourseCard(
                                  key: ValueKey(courses[i].id),
                                  course: courses[i]);
                            },
                          ),
                        )
                  : const Padding(
                      padding: EdgeInsets.all(100.0),
                      child: NoData(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
