import 'package:flutter/material.dart';
import 'package:my_lettutor_app/home/teacher_list/booking_modal.dart';
import 'package:my_lettutor_app/widgets/comment_card.dart';
import 'package:my_lettutor_app/widgets/course_card_list.dart';
import 'package:my_lettutor_app/widgets/no_data.dart';
import '../models/teacher.dart';
import './large_button.dart';
import './my_badge_list.dart';
import './row_button.dart';
import './teacher_detail_part.dart';
import './teacher_detail_tile.dart';

class TeacherDetailBody extends StatelessWidget {
  final Teacher teacher;
  const TeacherDetailBody({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  void _startBooking(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        builder: (_) {
          return BookingModal();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TeacherDetailTile(
            name: teacher.name,
            rating: teacher.rating,
            country: teacher.country,
          ),
        ),
        LargeButton(text: 'Booking', handler: () => _startBooking(context)),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: const RowButton(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            teacher.description,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        TeacherDetailPart(
          title: 'Languages',
          child: MyBadgeList(
            myList: teacher.languages,
            readOnly: true,
          ),
          hasPadding: true,
        ),
        TeacherDetailPart(
          title: 'Education',
          child: Text(
            teacher.education,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          hasPadding: true,
        ),
        TeacherDetailPart(
          title: 'Experience',
          child: Text(
            teacher.experience,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          hasPadding: true,
        ),
        TeacherDetailPart(
          title: 'Interests',
          child: Text(
            teacher.interests,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          hasPadding: true,
        ),
        TeacherDetailPart(
          title: 'Profession',
          child: Text(
            teacher.profession,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          hasPadding: true,
        ),
        TeacherDetailPart(
          title: 'Specialities',
          child: MyBadgeList(
            myList: teacher.specialities,
            readOnly: true,
          ),
          hasPadding: true,
        ),
        TeacherDetailPart(
          title: 'Course',
          child: teacher.courses != null
              ? CourseCardList(courses: teacher.courses!)
              : const NoData(),
          hasPadding: false,
        ),
        TeacherDetailPart(
          title: 'Rating and Comment (${teacher.comments.length})',
          child: Column(
            children: teacher.comments
                .map((comment) => CommentCard(comment: comment))
                .toList(),
          ),
          hasPadding: false,
        ),
      ],
    );
  }
}
