// To parse this JSON data, do
//
//     final pokemonEntity = pokemonEntityFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

PokemonEntity pokemonEntityFromJson(String str) =>
    PokemonEntity.fromJson(json.decode(str));

String pokemonEntityToJson(PokemonEntity data) => json.encode(data.toJson());

class PokemonEntity extends Equatable {
  final int? id;
  final String? name;
  final int? baseExperience;
  final int? height;
  final int? order;
  final int? weight;
  final List<Stat>? stats;
  final List<String>? types;
  final String? imgUrl;

  const PokemonEntity(
      {this.id,
      this.name,
      this.baseExperience,
      this.height,
      this.order,
      this.weight,
      this.stats,
      this.types,
      this.imgUrl});

  factory PokemonEntity.fromJson(Map<String, dynamic> json) => PokemonEntity(
        id: json["id"],
        name: json["name"],
        baseExperience: json["base_experience"],
        height: json["height"],
        order: json["order"],
        weight: json["weight"],
        stats: json["stats"] == null
            ? []
            : List<Stat>.from(json["stats"]!.map((x) => Stat.fromJson(x))),
        types: json["types"] == null
            ? []
            : List<String>.from(json["types"]!.map((x) => x)),
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "base_experience": baseExperience,
        "height": height,
        "order": order,
        "weight": weight,
        "stats": stats == null
            ? []
            : List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "imgUrl": imgUrl
      };

  @override
  List<Object?> get props =>
      [id, name, baseExperience, order, weight, stats, types, imgUrl];
}

class Stat extends Equatable {
  final int? baseStat;
  final String? name;

  const Stat({
    this.baseStat,
    this.name,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "name": name,
      };

  @override
  List<Object?> get props => [baseStat, name];
}
