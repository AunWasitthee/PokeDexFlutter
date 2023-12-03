// To parse this JSON data, do
//
//     final pokemonStat = pokemonStatFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

PokemonStatModel pokemonStatFromJson(String str) =>
    PokemonStatModel.fromJson(json.decode(str));

String pokemonStatToJson(PokemonStatModel data) => json.encode(data.toJson());

class PokemonStatModel {
  int? baseStat;
  int? effort;
  NamedApiResourceModel? stat;

  PokemonStatModel({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) =>
      PokemonStatModel(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: json["stat"] == null
            ? null
            : NamedApiResourceModel.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toJson(),
      };
}
