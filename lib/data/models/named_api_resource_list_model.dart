// To parse this JSON data, do
//
//     final namedApiResourceList = namedApiResourceListFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

NamedApiResourceListModel namedApiResourceListFromJson(String str) =>
    NamedApiResourceListModel.fromJson(json.decode(str));

String namedApiResourceListToJson(NamedApiResourceListModel data) =>
    json.encode(data.toJson());

class NamedApiResourceListModel {
  int? count;
  String? next;
  String? previous;
  List<NamedApiResourceModel>? results;

  NamedApiResourceListModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory NamedApiResourceListModel.fromJson(Map<String, dynamic> json) =>
      NamedApiResourceListModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<NamedApiResourceModel>.from(
                json["results"]!.map((x) => NamedApiResourceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}
