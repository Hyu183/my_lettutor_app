import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'package:my_lettutor_app/models/tutor.dart';

import 'package:my_lettutor_app/ui/course/course_card_list.dart';
import 'package:my_lettutor_app/ui/booking/booking_modal.dart';
import 'package:my_lettutor_app/utils/utils.dart';
import 'package:my_lettutor_app/widgets/button/icon_text_button.dart';
import 'package:my_lettutor_app/widgets/comment_card.dart';
import 'package:my_lettutor_app/ui/tutor/tutor_detail_part.dart';
import 'package:my_lettutor_app/ui/tutor/tutor_detail_tile.dart';
import 'package:my_lettutor_app/widgets/badge/my_badge_list.dart';
import 'package:my_lettutor_app/widgets/button/large_button.dart';
import 'package:my_lettutor_app/widgets/button/row_button.dart';
import 'package:my_lettutor_app/widgets/no_data.dart';

// import 'package:my_lettutor_app/models/temp/tutor.dart';

class TutorDetailBody extends StatelessWidget {
  final Tutor tutor;
  const TutorDetailBody({
    Key? key,
    required this.tutor,
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
          return BookingModal(tutorId: tutor.userId!,);
        });
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: LargeButton(
                  text: translator.bookingBtn,
                  handler: () => _startBooking(context)),
            ),
            Container(
              child: IconTextButton(
                icon: Icons.report,
                text: translator.reportTextBtn,
                handler: () {},
              ),
            ),
          ],
        ),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            tutor.bio!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        TutorDetailPart(
          title: translator.languagesText,
          child: MyBadgeList(
            myList: Utils.parseLanguages(tutor.languages!),
            readOnly: true,
          ),
          hasPadding: true,
        ),
        TutorDetailPart(
          title: translator.educationText,
          child: Text(
            tutor.education!,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          hasPadding: true,
        ),
        TutorDetailPart(
          title: translator.experienceText,
          child: Text(
            tutor.experience!,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          hasPadding: true,
        ),
        TutorDetailPart(
          title: translator.interestsText,
          child: Text(
            tutor.interests!,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          hasPadding: true,
        ),
        TutorDetailPart(
          title: translator.professionText,
          child: Text(
            tutor.profession!,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          hasPadding: true,
        ),
        TutorDetailPart(
          title: translator.specialitiesText,
          child: MyBadgeList(
            myList: Utils.parseSpecialties(tutor.specialties!),
            readOnly: true,
          ),
          hasPadding: true,
        ),
        // TutorDetailPart(
        //   title: translator.courseText,
        //   child: tutor.courses != null
        //       ? CourseCardList(courses: tutor.courses!)
        //       : const NoData(),
        //   hasPadding: false,
        // ),
        TutorDetailPart(
          title:
              '${translator.ratingAndCommentText} (${tutor.user!.feedbacks == null ? 0 : tutor.user!.feedbacks!.length})',
          child: tutor.user!.feedbacks != null
              ? Column(
                  children: tutor.user!.feedbacks!
                      .map((feedback) => FeedbackCard(feedback: feedback))
                      .toList(),
                )
              : Container(),
          hasPadding: false,
        ),
      ],
    );
  }
}
