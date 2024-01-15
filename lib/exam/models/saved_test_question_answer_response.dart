// To parse this JSON data, do
//
//     final savedTestQuestionAnswerResponse = savedTestQuestionAnswerResponseFromJson(jsonString);

import 'dart:convert';

SavedTestQuestionAnswerResponse savedTestQuestionAnswerResponseFromJson(String str) => SavedTestQuestionAnswerResponse.fromJson(json.decode(str));

String savedTestQuestionAnswerResponseToJson(SavedTestQuestionAnswerResponse data) => json.encode(data.toJson());

class SavedTestQuestionAnswerResponse {
  String? status;
  String? message;
  ResponseData? data;

  SavedTestQuestionAnswerResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SavedTestQuestionAnswerResponse.fromJson(Map<String, dynamic> json) => SavedTestQuestionAnswerResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class ResponseData {
  String? timeSpent;
  String? totalQuestions;
  dynamic isExam;
  List<SavedQuestion>? questions;

  ResponseData({
    this.timeSpent,
    this.totalQuestions,
    this.isExam,
    this.questions,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    timeSpent: json["time_spent"],
    totalQuestions: json["total_questions"],
    isExam: json["is_exam"],
    questions: json["questions"] == null ? [] : List<SavedQuestion>.from(json["questions"]!.map((x) => SavedQuestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "time_spent": timeSpent,
    "total_questions": totalQuestions,
    "is_exam": isExam,
    "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
  };
}

class SavedQuestion {
  int? id;
  String? question;
  String? name;
  String? year;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  dynamic questionDescription;
  dynamic questionDescriptionShow;
  dynamic theory;
  int? type;
  String? explanation;
  bool? isCorrect;
  int? userOption;
  int? rightOption;
  bool? isAttempt;
  List<dynamic>? comments;
  Statistics? statistics;
  bool? isFlag;

  SavedQuestion({
    this.id,
    this.question,
    this.name,
    this.year,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.questionDescription,
    this.questionDescriptionShow,
    this.theory,
    this.type,
    this.explanation,
    this.isCorrect,
    this.userOption,
    this.rightOption,
    this.isAttempt,
    this.comments,
    this.statistics,
    this.isFlag,
  });

  factory SavedQuestion.fromJson(Map<String, dynamic> json) => SavedQuestion(
    id: json["id"],
    question: json["question"],
    name: json["name"],
    year: json["year"],
    option1: json["option_1"],
    option2: json["option_2"],
    option3: json["option_3"],
    option4: json["option_4"],
    questionDescription: json["question_description"],
    questionDescriptionShow: json["question_description_show"],
    theory: json["theory"],
    type: json["type"],
    explanation: json["explanation"],
    isCorrect: json["isCorrect"],
    userOption: json["userOption"],
    rightOption: json["rightOption"],
    isAttempt: json["isAttempt"],
    comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
    statistics: json["statistics"] == null ? null : Statistics.fromJson(json["statistics"]),
    isFlag: json["isFlag"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "name": name,
    "year": year,
    "option_1": option1,
    "option_2": option2,
    "option_3": option3,
    "option_4": option4,
    "question_description": questionDescription,
    "question_description_show": questionDescriptionShow,
    "theory": theory,
    "type": type,
    "explanation": explanation,
    "isCorrect": isCorrect,
    "userOption": userOption,
    "rightOption": rightOption,
    "isAttempt": isAttempt,
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
    "statistics": statistics?.toJson(),
    "isFlag": isFlag,
  };
}

class Statistics {
  int? allAppearedTest;
  int? allAnsweredCorrect;
  int? userAppearedTest;
  int? userAnsweredCorrect;

  Statistics({
    this.allAppearedTest,
    this.allAnsweredCorrect,
    this.userAppearedTest,
    this.userAnsweredCorrect,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    allAppearedTest: json["allAppearedTest"],
    allAnsweredCorrect: json["allAnsweredCorrect"],
    userAppearedTest: json["userAppearedTest"],
    userAnsweredCorrect: json["userAnsweredCorrect"],
  );

  Map<String, dynamic> toJson() => {
    "allAppearedTest": allAppearedTest,
    "allAnsweredCorrect": allAnsweredCorrect,
    "userAppearedTest": userAppearedTest,
    "userAnsweredCorrect": userAnsweredCorrect,
  };
}


///save all ques with ans
class SaveAllQuestionWithAnswerModel {
  String? status;
  String? message;
  Data? data;

  SaveAllQuestionWithAnswerModel({this.status, this.message, this.data});

  SaveAllQuestionWithAnswerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userTestId;
  int? expiryTime;
  List<Questions>? questions;

  Data({this.userTestId, this.expiryTime, this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    userTestId = json['user_test_id'];
    expiryTime = json['expiryTime'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_test_id'] = userTestId;
    data['expiryTime'] = expiryTime;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? courseId;
  int? subjectId;
  int? topicId;
  int? id;
  String? question;
  String? name;
  String? year;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  int? answer;
  String? questionDescription;
  String? questionDescriptionShow;
  String? theory;
  int? type;
  String? explanation;

  Questions(
      {this.courseId,
        this.subjectId,
        this.topicId,
        this.id,
        this.question,
        this.name,
        this.year,
        this.option1,
        this.option2,
        this.option3,
        this.option4,
        this.answer,
        this.questionDescription,
        this.questionDescriptionShow,
        this.theory,
        this.type,
        this.explanation});

  Questions.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    subjectId = json['subject_id'];
    topicId = json['topic_id'];
    id = json['id'];
    question = json['question'];
    name = json['name'];
    year = json['year'];
    option1 = json['option_1'];
    option2 = json['option_2'];
    option3 = json['option_3'];
    option4 = json['option_4'];
    answer = json['answer'];
    questionDescription = json['question_description'];
    questionDescriptionShow = json['question_description_show'];
    theory = json['theory'];
    type = json['type'];
    explanation = json['explanation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_id'] = courseId;
    data['subject_id'] = subjectId;
    data['topic_id'] = topicId;
    data['id'] = id;
    data['question'] = question;
    data['name'] = name;
    data['year'] = year;
    data['option_1'] = option1;
    data['option_2'] = option2;
    data['option_3'] = option3;
    data['option_4'] = option4;
    data['answer'] = answer;
    data['question_description'] = questionDescription;
    data['question_description_show'] = questionDescriptionShow;
    data['theory'] = theory;
    data['type'] = type;
    data['explanation'] = explanation;
    return data;
  }
}
