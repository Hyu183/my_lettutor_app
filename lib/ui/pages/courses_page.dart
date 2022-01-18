import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/course.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:my_lettutor_app/ui/course/course_card.dart';
import 'package:my_lettutor_app/ui/messages/message_list_tile.dart';
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
  List<Course> courses = [];
  int currentPage = 1;
  int perPage = 10;
  int countTotal = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCourse();
  }

  void getCourse() {
    var dio = DioClient.dio;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var accessToken =
          context.read<AuthProvider>().userToken.tokens!.access!.token!;

      var query = {'page': currentPage, 'size': perPage};
      try {
        var response = await dio.get('/course', queryParameters: query);
        Iterable rawCourses = response.data['data']['rows'];

        var courseList =
            rawCourses.map((course) => Course.fromJson(course)).toList();

        setState(() {
          courses = courseList;
          isLoading = false;
        });
      } catch (e) {}
    });
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
                // onChanged: (_) =>
                //     stopTypingChecker.run(_searchTutorNameHandler),
                // controller: _searchTextController,
              ),
            ),
            Expanded(
              child: messages.isNotEmpty
                  ? ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (_, i) {
                        return ListTile(
                            
                          leading: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(courses[i].imageUrl!),
                              ),
                            ),
                          ),
                        );
                        // return CourseCard(course: courses[i] ,);
                      },
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
