// To parse this JSON data, do
//
//     final lmsExamDetailsResponse = lmsExamDetailsResponseFromJson(jsonString);

import 'dart:convert';

LmsExamDetailsResponse lmsExamDetailsResponseFromJson(String str) => LmsExamDetailsResponse.fromJson(json.decode(str));

String lmsExamDetailsResponseToJson(LmsExamDetailsResponse data) => json.encode(data.toJson());

class LmsExamDetailsResponse {
  int? status;
  String? message;
  ResultLmsExam? result;

  LmsExamDetailsResponse({
    this.status,
    this.message,
    this.result,
  });

  factory LmsExamDetailsResponse.fromJson(Map<String, dynamic> json) => LmsExamDetailsResponse(
    status: json["status"],
    message: json["message"],
    result: json["result"] == null ? null : ResultLmsExam.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result?.toJson(),
  };
}

class ResultLmsExam {
  String? courseName;
  String? subjectName;
  DateTime? createdAt;
  int? type;
  dynamic? totalQuestions;
  String? timeSpent;
  int? id;
  String? testId;
  int? isExam;
  List<QuestionsDatum>? questionsData;

  ResultLmsExam({
    this.courseName,
    this.subjectName,
    this.createdAt,
    this.type,
    this.totalQuestions,
    this.timeSpent,
    this.id,
    this.testId,
    this.isExam,
    this.questionsData,
  });

  factory ResultLmsExam.fromJson(Map<String, dynamic> json) => ResultLmsExam(
    courseName: json["courseName"],
    subjectName: json["subjectName"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    type: json["type"],
    totalQuestions: json["total_questions"],
    timeSpent: json["time_spent"],
    id: json["id"],
    testId: json["test_id"],
    isExam: json["is_exam"],
    questionsData: json["questionsData"] == null ? [] : List<QuestionsDatum>.from(json["questionsData"]!.map((x) => QuestionsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courseName": courseName,
    "subjectName": subjectName,
    "created_at": createdAt?.toIso8601String(),
    "type": type,
    "total_questions": totalQuestions,
    "time_spent": timeSpent,
    "id": id,
    "test_id": testId,
    "is_exam": isExam,
    "questionsData": questionsData == null ? [] : List<dynamic>.from(questionsData!.map((x) => x.toJson())),
  };
}

class QuestionsDatum {
  String? question;
  int? answer;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  int? choosenOption;
  int? questionId;
  String? explanation;
  bool? isCorrect;
  List<dynamic>? comments;

  QuestionsDatum({
    this.question,
    this.answer,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.choosenOption,
    this.questionId,
    this.explanation,
    this.isCorrect,
    this.comments,
  });

  factory QuestionsDatum.fromJson(Map<String, dynamic> json) => QuestionsDatum(
    question: json["question"],
    answer: json["answer"],
    option1: json["option_1"],
    option2: json["option_2"],
    option3: json["option_3"],
    option4: json["option_4"],
    choosenOption: json["choosen_option"],
    questionId: json["questionId"],
    explanation: json["explanation"],
    isCorrect: json["isCorrect"],
    comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
    "option_1": option1,
    "option_2": option2,
    "option_3": option3,
    "option_4": option4,
    "choosen_option": choosenOption,
    "questionId": questionId,
    "explanation": explanation,
    "isCorrect": isCorrect,
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
  };
}
