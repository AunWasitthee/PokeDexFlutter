// To parse this JSON data, do
//
//     final namedApiResource = namedApiResourceFromJson(jsonString);

import 'dart:convert';

NamedApiResourceModel namedApiResourceFromJson(String str) =>
    NamedApiResourceModel.fromJson(json.decode(str));

String namedApiResourceToJson(NamedApiResourceModel data) =>
    json.encode(data.toJson());

class NamedApiResourceModel {
  String? name;
  String? url;

  NamedApiResourceModel({
    this.name,
    this.url,
  });

  factory NamedApiResourceModel.fromJson(Map<String, dynamic> json) =>
      NamedApiResourceModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
