import 'package:flutter/material.dart';
import 'package:my_lettutor_app/models/course.dart';

import 'package:my_lettutor_app/ui/course/course_detail.dart';
import 'package:my_lettutor_app/utils/utils.dart';

// import 'package:my_lettutor_app/models/temp/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              CourseDetail.routeName,
              arguments: course,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Flexible(flex: 2, child: Image.network(course.imageUrl!,cacheHeight: 188, cacheWidth: 250,)),
                Text(
                  course.name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  course.description!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(Utils.getLevelString(course.level!),
                        style: const TextStyle(
                          fontSize: 18,
                        )),
                    const Text('-',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    Text('${course.topics!.length} Lessons',
                        style: const TextStyle(
                          fontSize: 18,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    // return Container(
    //   height: 300,
    //   width: 250,
    //   margin: const EdgeInsets.symmetric(horizontal: 10),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     color: Colors.blue[100],
    //   ),
    //   child: Column(
    //     children: [
    //       Container(
    //         height: 150,
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: NetworkImage(course.imageUrl!),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 10,
    //                 vertical: 9,
    //               ),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     course.name!,
    //                     style: const TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 25,
    //                     ),
    //                     overflow: TextOverflow.ellipsis,
    //                     maxLines: 1,
    //                   ),
    //                   const SizedBox(
    //                     height: 8,
    //                   ),
    //                   Text(
    //                     course.description!,
    //                     style: const TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 15,
    //                       color: Colors.grey,
    //                     ),
    //                     overflow: TextOverflow.ellipsis,
    //                     maxLines: 2,
    //                   ),
    //                   const SizedBox(
    //                     height: 8,
    //                   ),
    //                   Row(
    //                     children: [
    //                       const Icon(Icons.leaderboard_rounded),
    //                       const SizedBox(
    //                         width: 10,
    //                       ),
    //                       Text(course.level!),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Expanded(
    //               child: SizedBox(
    //                 width: double.infinity,
    //                 child: OutlinedButton(
    //                   onPressed: () {
    //                     Navigator.of(context).pushNamed(
    //                       CourseDetail.routeName,
    //                       arguments: course,
    //                     );
    //                   },
    //                   child: const Text('Explore'),
    //                   style: OutlinedButton.styleFrom(
    //                     primary: Theme.of(context).textTheme.headline2!.color!,
    //                     backgroundColor: Colors.white,
    //                     side: BorderSide(
    //                         color:
    //                             Theme.of(context).textTheme.headline2!.color!),
    //                     shape: const RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.only(
    //                         bottomLeft: Radius.circular(10),
    //                         bottomRight: Radius.circular(10),
    //                       ),
    //                     ),

    //                     //   side: Border.symmetric(),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
