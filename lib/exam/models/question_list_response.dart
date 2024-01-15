// To parse this JSON data, do
//
//     final questionListResponse = questionListResponseFromJson(jsonString);

import 'dart:convert';

QuestionListResponse questionListResponseFromJson(String str) => QuestionListResponse.fromJson(json.decode(str));

String questionListResponseToJson(QuestionListResponse data) => json.encode(data.toJson());

class QuestionListResponse {
  QuestionListResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  QuestionData? data;

  factory QuestionListResponse.fromJson(Map<String, dynamic> json) => QuestionListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : QuestionData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class QuestionData {
  QuestionData({
    this.questions,
    this.courseId,
    this.subjectid,
    this.examName,
  });

  List<Question>? questions;
  int? courseId;
  String? subjectid;
  String? examName;

  factory QuestionData.fromJson(Map<String, dynamic> json) => QuestionData(
    questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
    courseId: json["courseId"],
    subjectid: json["subjectid"],
    examName: json["examName"],
  );

  Map<String, dynamic> toJson() => {
    "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
    "courseId": courseId,
    "subjectid": subjectid,
    "examName": examName,
  };
}

class Question {
  Question({
    this.id,
    this.question,
    this.name,
    this.year,
    this.questionDescription,
    this.questionDescriptionShow,
    this.topicName,
    this.courseName,
    this.subjectName,
  });

  int? id;
  String? question;
  String? name;
  String? year;
  dynamic questionDescription;
  int? questionDescriptionShow;
  String? topicName;
  String? courseName;
  String? subjectName;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    question: json["question"],
    name: json["name"],
    year: json["year"],
    questionDescription: json["question_description"],
    questionDescriptionShow: json["question_description_show"],
    topicName: json["topicName"],
    courseName: json["courseName"],
    subjectName: json["subjectName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "name": name,
    "year": year,
    "question_description": questionDescription,
    "question_description_show": questionDescriptionShow,
    "topicName": topicName,
    "courseName": courseName,
    "subjectName": subjectName,
  };
}
//
// enum CourseName { UTME_JAMB }
//
// final courseNameValues = EnumValues({
//   "UTME JAMB": CourseName.UTME_JAMB
// });
//
// enum Name { FORM_AND_FUNCTIONS, HEREDITY_AND_VARIATIONS, ECOLOGY, EVOLUTION, VARIETY_OF_ORGANISMS }
//
// final nameValues = EnumValues({
//   "ECOLOGY": Name.ECOLOGY,
//   "EVOLUTION": Name.EVOLUTION,
//   "FORM AND FUNCTIONS": Name.FORM_AND_FUNCTIONS,
//   "HEREDITY AND VARIATIONS": Name.HEREDITY_AND_VARIATIONS,
//   "VARIETY OF ORGANISMS": Name.VARIETY_OF_ORGANISMS
// });
//
// enum SubjectName { BIOLOGY }
//
// final subjectNameValues = EnumValues({
//   "BIOLOGY": SubjectName.BIOLOGY
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
