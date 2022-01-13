import 'package:json_annotation/json_annotation.dart';
import 'package:my_lettutor_app/models/category.dart';
import 'package:my_lettutor_app/models/topic.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? otherDetails;
  int? defaultPrice;
  int? coursePrice;
  String? courseType;
  String? sectionType;
  bool? visible;
  String? createdAt;
  String? updatedAt;
  List<Topic>? topics;
  List<Category>? categories;

  Course(
      this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.level,
      this.reason,
      this.purpose,
      this.otherDetails,
      this.defaultPrice,
      this.coursePrice,
      this.courseType,
      this.sectionType,
      this.visible,
      this.createdAt,
      this.updatedAt,
      this.topics,
      this.categories);

      factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
