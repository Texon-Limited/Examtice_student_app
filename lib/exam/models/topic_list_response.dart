// To parse this JSON data, do
//
//     final topicListResponse = topicListResponseFromJson(jsonString);

import 'dart:convert';

TopicListResponse topicListResponseFromJson(String str) => TopicListResponse.fromJson(json.decode(str));

String topicListResponseToJson(TopicListResponse data) => json.encode(data.toJson());

class TopicListResponse {
  TopicListResponse({
    this.status,
    this.message,
    this.numberOfQuestion,
    this.aveTotalQuestion,
    this.data,
  });

  String? status;
  String? message;
  int? numberOfQuestion;
  int? aveTotalQuestion;
  List<TopicDatum>? data;

  factory TopicListResponse.fromJson(Map<String, dynamic> json) => TopicListResponse(
    status: json["status"],
    message: json["message"],
    numberOfQuestion: json["number_of_question"],
    aveTotalQuestion: json["ave_total_question"],
    data: json["data"] == null ? [] : List<TopicDatum>.from(json["data"]!.map((x) => TopicDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "number_of_question": numberOfQuestion,
    "ave_total_question": aveTotalQuestion,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class TopicDatum {
  TopicDatum({
    this.topicId,
    this.topicName,
    this.count,
    this.show,
    this.topicflagquestions,
  });

  int? topicId;
  String? topicName;
  int? count;
  int? show;
  int? topicflagquestions;

  factory TopicDatum.fromJson(Map<String, dynamic> json) => TopicDatum(
    topicId: json["topic_id"],
    topicName: json["topic_name"],
    count: json["count"],
    show: json["show"],
    topicflagquestions: json["topicflagquestions"],
  );

  Map<String, dynamic> toJson() => {
    "topic_id": topicId,
    "topic_name": topicName,
    "count": count,
    "show": show,
    "topicflagquestions": topicflagquestions,
  };
}
