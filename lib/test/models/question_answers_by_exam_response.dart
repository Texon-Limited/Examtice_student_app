// To parse this JSON data, do
//
//     final questionAnswerJsonResponseByExam = questionAnswerJsonResponseByExamFromJson(jsonString);

import 'dart:convert';

QuestionAnswerJsonResponseByExam questionAnswerJsonResponseByExamFromJson(String str) => QuestionAnswerJsonResponseByExam.fromJson(json.decode(str));

String questionAnswerJsonResponseByExamToJson(QuestionAnswerJsonResponseByExam data) => json.encode(data.toJson());

class QuestionAnswerJsonResponseByExam {
  QuestionAnswerJsonResponseByExam({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  Result? result;

  factory QuestionAnswerJsonResponseByExam.fromJson(Map<String, dynamic> json) => QuestionAnswerJsonResponseByExam(
    status: json["status"],
    message: json["message"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result?.toJson(),
  };
}

class Result {
  Result({
    this.courseName,
    this.subjectName,
    this.createdAt,
    this.type,
    this.totalQuestions,
    this.examTime,
    this.id,
    this.examId,
    this.questionsData,
  });

  String? courseName;
  String? subjectName;
  DateTime? createdAt;
  int? type;
  int? totalQuestions;
  dynamic examTime;
  int? id;
  String? examId;
  List<QuestionsDatum>? questionsData;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    courseName: json["courseName"],
    subjectName: json["subjectName"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    type: json["type"],
    totalQuestions: json["total_questions"],
    examTime: json["exam_time"],
    id: json["id"],
    examId: json["exam_id"],
    questionsData: json["questionsData"] == null ? [] : List<QuestionsDatum>.from(json["questionsData"]!.map((x) => QuestionsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courseName": courseName,
    "subjectName": subjectName,
    "created_at": createdAt?.toIso8601String(),
    "type": type,
    "total_questions": totalQuestions,
    "exam_time": examTime,
    "id": id,
    "exam_id": examId,
    "questionsData": questionsData == null ? [] : List<dynamic>.from(questionsData!.map((x) => x.toJson())),
  };
}

class QuestionsDatum {
  QuestionsDatum({
    this.questionId,
    this.question,
    this.year,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.answer,
    this.comments,
  });

  int? questionId;
  String? question;
  String? year;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  int? answer;
  List<dynamic>? comments;

  factory QuestionsDatum.fromJson(Map<String, dynamic> json) => QuestionsDatum(
    questionId: json["questionId"],
    question: json["question"],
    year: json["year"],
    option1: json["option_1"],
    option2: json["option_2"],
    option3: json["option_3"],
    option4: json["option_4"],
    answer: json["answer"],
    comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "questionId": questionId,
    "question": question,
    "year": year,
    "option_1": option1,
    "option_2": option2,
    "option_3": option3,
    "option_4": option4,
    "answer": answer,
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
  };
}
