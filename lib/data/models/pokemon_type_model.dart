// To parse this JSON data, do
//
//     final pokemonType = pokemonTypeFromJson(jsonString);

import 'dart:convert';

PokemonTypeModel pokemonTypeFromJson(String str) =>
    PokemonTypeModel.fromJson(json.decode(str));

String pokemonTypeToJson(PokemonTypeModel data) => json.encode(data.toJson());

class PokemonTypeModel {
  int? slot;
  Type? type;

  PokemonTypeModel({
    this.slot,
    this.type,
  });

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      PokemonTypeModel(
        slot: json["slot"],
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
      };
}

class Type {
  String? name;
  String? url;

  Type({
    this.name,
    this.url,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
