// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

import '../../domain/domain.dart';
import 'models.dart';

PokemonModel pokemonFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str));

String pokemonToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  int? id;
  String? name;
  int? baseExperience;
  int? height;
  bool? isDefault;
  int? order;
  int? weight;
  // List<Ability>? abilities;
  // List<Species>? forms;
  // List<GameIndex>? gameIndices;
  // List<HeldItem>? heldItems;
  // String? locationAreaEncounters;
  // List<Move>? moves;
  // Species? species;
  // Sprites? sprites;
  List<PokemonStatModel>? stats;
  List<PokemonTypeModel>? types;
  // List<PastType>? pastTypes;

  PokemonModel({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    // this.abilities,
    // this.forms,
    // this.gameIndices,
    // this.heldItems,
    // this.locationAreaEncounters,
    // this.moves,
    // this.species,
    // this.sprites,
    this.stats,
    this.types,
    // this.pastTypes,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        name: json["name"],
        baseExperience: json["base_experience"],
        height: json["height"],
        isDefault: json["is_default"],
        order: json["order"],
        weight: json["weight"],
        // abilities: json["abilities"] == null
        //     ? []
        //     : List<Ability>.from(
        //         json["abilities"]!.map((x) => Ability.fromJson(x))),
        // forms: json["forms"] == null
        //     ? []
        //     : List<Species>.from(
        //         json["forms"]!.map((x) => Species.fromJson(x))),
        // gameIndices: json["game_indices"] == null
        //     ? []
        //     : List<GameIndex>.from(
        //         json["game_indices"]!.map((x) => GameIndex.fromJson(x))),
        // heldItems: json["held_items"] == null
        //     ? []
        //     : List<HeldItem>.from(
        //         json["held_items"]!.map((x) => HeldItem.fromJson(x))),
        // locationAreaEncounters: json["location_area_encounters"],
        // moves: json["moves"] == null
        //     ? []
        //     : List<Move>.from(json["moves"]!.map((x) => Move.fromJson(x))),
        // species:
        //     json["species"] == null ? null : Species.fromJson(json["species"]),
        // sprites:
        //     json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        stats: json["stats"] == null
            ? []
            : List<PokemonStatModel>.from(
                json["stats"]!.map((x) => PokemonStatModel.fromJson(x))),
        types: json["types"] == null
            ? []
            : List<PokemonTypeModel>.from(
                json["types"]!.map((x) => PokemonTypeModel.fromJson(x))),
        // pastTypes: json["past_types"] == null
        //     ? []
        //     : List<PastType>.from(
        //         json["past_types"]!.map((x) => PastType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "base_experience": baseExperience,
        "height": height,
        "is_default": isDefault,
        "order": order,
        "weight": weight,
        // "abilities": abilities == null
        //     ? []
        //     : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        // "forms": forms == null
        //     ? []
        //     : List<dynamic>.from(forms!.map((x) => x.toJson())),
        // "game_indices": gameIndices == null
        //     ? []
        //     : List<dynamic>.from(gameIndices!.map((x) => x.toJson())),
        // "held_items": heldItems == null
        //     ? []
        //     : List<dynamic>.from(heldItems!.map((x) => x.toJson())),
        // "location_area_encounters": locationAreaEncounters,
        // "moves": moves == null
        //     ? []
        //     : List<dynamic>.from(moves!.map((x) => x.toJson())),
        // "species": species?.toJson(),
        // "sprites": sprites?.toJson(),
        "stats": stats == null
            ? []
            : List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": types == null
            ? []
            : List<dynamic>.from(types!.map((x) => x.toJson())),
        // "past_types": pastTypes == null
        //     ? []
        //     : List<dynamic>.from(pastTypes!.map((x) => x.toJson())),
      };

  PokemonEntity toEntity() => PokemonEntity(
      id: id,
      name: name,
      baseExperience: baseExperience,
      height: height,
      order: order,
      weight: weight,
      stats: stats
          ?.map((e) => Stat(baseStat: e.baseStat, name: e.stat?.name))
          .toList(),
      types: types?.map((e) => e.type?.name ?? '').toList(),
      imgUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png');
}
//
// class Ability {
//   bool? isHidden;
//   int? slot;
//   Species? ability;
//
//   Ability({
//     this.isHidden,
//     this.slot,
//     this.ability,
//   });
//
//   factory Ability.fromJson(Map<String, dynamic> json) => Ability(
//         isHidden: json["is_hidden"],
//         slot: json["slot"],
//         ability:
//             json["ability"] == null ? null : Species.fromJson(json["ability"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "is_hidden": isHidden,
//         "slot": slot,
//         "ability": ability?.toJson(),
//       };
// }
//
// class Species {
//   String? name;
//   String? url;
//
//   Species({
//     this.name,
//     this.url,
//   });
//
//   factory Species.fromJson(Map<String, dynamic> json) => Species(
//         name: json["name"],
//         url: json["url"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "url": url,
//       };
// }
//
// class GameIndex {
//   int? gameIndex;
//   Species? version;
//
//   GameIndex({
//     this.gameIndex,
//     this.version,
//   });
//
//   factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
//         gameIndex: json["game_index"],
//         version:
//             json["version"] == null ? null : Species.fromJson(json["version"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "game_index": gameIndex,
//         "version": version?.toJson(),
//       };
// }
//
// class HeldItem {
//   Species? item;
//   List<VersionDetail>? versionDetails;
//
//   HeldItem({
//     this.item,
//     this.versionDetails,
//   });
//
//   factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
//         item: json["item"] == null ? null : Species.fromJson(json["item"]),
//         versionDetails: json["version_details"] == null
//             ? []
//             : List<VersionDetail>.from(
//                 json["version_details"]!.map((x) => VersionDetail.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "item": item?.toJson(),
//         "version_details": versionDetails == null
//             ? []
//             : List<dynamic>.from(versionDetails!.map((x) => x.toJson())),
//       };
// }
//
// class VersionDetail {
//   int? rarity;
//   Species? version;
//
//   VersionDetail({
//     this.rarity,
//     this.version,
//   });
//
//   factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
//         rarity: json["rarity"],
//         version:
//             json["version"] == null ? null : Species.fromJson(json["version"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "rarity": rarity,
//         "version": version?.toJson(),
//       };
// }
//
// class Move {
//   Species? move;
//   List<VersionGroupDetail>? versionGroupDetails;
//
//   Move({
//     this.move,
//     this.versionGroupDetails,
//   });
//
//   factory Move.fromJson(Map<String, dynamic> json) => Move(
//         move: json["move"] == null ? null : Species.fromJson(json["move"]),
//         versionGroupDetails: json["version_group_details"] == null
//             ? []
//             : List<VersionGroupDetail>.from(json["version_group_details"]!
//                 .map((x) => VersionGroupDetail.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "move": move?.toJson(),
//         "version_group_details": versionGroupDetails == null
//             ? []
//             : List<dynamic>.from(versionGroupDetails!.map((x) => x.toJson())),
//       };
// }
//
// class VersionGroupDetail {
//   int? levelLearnedAt;
//   Species? versionGroup;
//   Species? moveLearnMethod;
//
//   VersionGroupDetail({
//     this.levelLearnedAt,
//     this.versionGroup,
//     this.moveLearnMethod,
//   });
//
//   factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
//       VersionGroupDetail(
//         levelLearnedAt: json["level_learned_at"],
//         versionGroup: json["version_group"] == null
//             ? null
//             : Species.fromJson(json["version_group"]),
//         moveLearnMethod: json["move_learn_method"] == null
//             ? null
//             : Species.fromJson(json["move_learn_method"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "level_learned_at": levelLearnedAt,
//         "version_group": versionGroup?.toJson(),
//         "move_learn_method": moveLearnMethod?.toJson(),
//       };
// }
//
// class PastType {
//   Species? generation;
//   List<Type>? types;
//
//   PastType({
//     this.generation,
//     this.types,
//   });
//
//   factory PastType.fromJson(Map<String, dynamic> json) => PastType(
//         generation: json["generation"] == null
//             ? null
//             : Species.fromJson(json["generation"]),
//         types: json["types"] == null
//             ? []
//             : List<Type>.from(json["types"]!.map((x) => Type.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "generation": generation?.toJson(),
//         "types": types == null
//             ? []
//             : List<dynamic>.from(types!.map((x) => x.toJson())),
//       };
// }
//
// class GenerationV {
//   Sprites? blackWhite;
//
//   GenerationV({
//     this.blackWhite,
//   });
//
//   factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
//         blackWhite: json["black-white"] == null
//             ? null
//             : Sprites.fromJson(json["black-white"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "black-white": blackWhite?.toJson(),
//       };
// }
//
// class GenerationIv {
//   Sprites? diamondPearl;
//   Sprites? heartgoldSoulsilver;
//   Sprites? platinum;
//
//   GenerationIv({
//     this.diamondPearl,
//     this.heartgoldSoulsilver,
//     this.platinum,
//   });
//
//   factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
//         diamondPearl: json["diamond-pearl"] == null
//             ? null
//             : Sprites.fromJson(json["diamond-pearl"]),
//         heartgoldSoulsilver: json["heartgold-soulsilver"] == null
//             ? null
//             : Sprites.fromJson(json["heartgold-soulsilver"]),
//         platinum: json["platinum"] == null
//             ? null
//             : Sprites.fromJson(json["platinum"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "diamond-pearl": diamondPearl?.toJson(),
//         "heartgold-soulsilver": heartgoldSoulsilver?.toJson(),
//         "platinum": platinum?.toJson(),
//       };
// }
//
// class Versions {
//   GenerationI? generationI;
//   GenerationIi? generationIi;
//   GenerationIii? generationIii;
//   GenerationIv? generationIv;
//   GenerationV? generationV;
//   Map<String, Home>? generationVi;
//   GenerationVii? generationVii;
//   GenerationViii? generationViii;
//
//   Versions({
//     this.generationI,
//     this.generationIi,
//     this.generationIii,
//     this.generationIv,
//     this.generationV,
//     this.generationVi,
//     this.generationVii,
//     this.generationViii,
//   });
//
//   factory Versions.fromJson(Map<String, dynamic> json) => Versions(
//         generationI: json["generation-i"] == null
//             ? null
//             : GenerationI.fromJson(json["generation-i"]),
//         generationIi: json["generation-ii"] == null
//             ? null
//             : GenerationIi.fromJson(json["generation-ii"]),
//         generationIii: json["generation-iii"] == null
//             ? null
//             : GenerationIii.fromJson(json["generation-iii"]),
//         generationIv: json["generation-iv"] == null
//             ? null
//             : GenerationIv.fromJson(json["generation-iv"]),
//         generationV: json["generation-v"] == null
//             ? null
//             : GenerationV.fromJson(json["generation-v"]),
//         generationVi: Map.from(json["generation-vi"]!)
//             .map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
//         generationVii: json["generation-vii"] == null
//             ? null
//             : GenerationVii.fromJson(json["generation-vii"]),
//         generationViii: json["generation-viii"] == null
//             ? null
//             : GenerationViii.fromJson(json["generation-viii"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "generation-i": generationI?.toJson(),
//         "generation-ii": generationIi?.toJson(),
//         "generation-iii": generationIii?.toJson(),
//         "generation-iv": generationIv?.toJson(),
//         "generation-v": generationV?.toJson(),
//         "generation-vi": Map.from(generationVi!)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "generation-vii": generationVii?.toJson(),
//         "generation-viii": generationViii?.toJson(),
//       };
// }
//
// class Sprites {
//   String? backDefault;
//   dynamic backFemale;
//   String? backShiny;
//   dynamic backShinyFemale;
//   String? frontDefault;
//   dynamic frontFemale;
//   String? frontShiny;
//   dynamic frontShinyFemale;
//   Other? other;
//   Versions? versions;
//   Sprites? animated;
//
//   Sprites({
//     this.backDefault,
//     this.backFemale,
//     this.backShiny,
//     this.backShinyFemale,
//     this.frontDefault,
//     this.frontFemale,
//     this.frontShiny,
//     this.frontShinyFemale,
//     this.other,
//     this.versions,
//     this.animated,
//   });
//
//   factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
//         backDefault: json["back_default"],
//         backFemale: json["back_female"],
//         backShiny: json["back_shiny"],
//         backShinyFemale: json["back_shiny_female"],
//         frontDefault: json["front_default"],
//         frontFemale: json["front_female"],
//         frontShiny: json["front_shiny"],
//         frontShinyFemale: json["front_shiny_female"],
//         other: json["other"] == null ? null : Other.fromJson(json["other"]),
//         versions: json["versions"] == null
//             ? null
//             : Versions.fromJson(json["versions"]),
//         animated: json["animated"] == null
//             ? null
//             : Sprites.fromJson(json["animated"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "back_default": backDefault,
//         "back_female": backFemale,
//         "back_shiny": backShiny,
//         "back_shiny_female": backShinyFemale,
//         "front_default": frontDefault,
//         "front_female": frontFemale,
//         "front_shiny": frontShiny,
//         "front_shiny_female": frontShinyFemale,
//         "other": other?.toJson(),
//         "versions": versions?.toJson(),
//         "animated": animated?.toJson(),
//       };
// }
//
// class GenerationI {
//   RedBlue? redBlue;
//   RedBlue? yellow;
//
//   GenerationI({
//     this.redBlue,
//     this.yellow,
//   });
//
//   factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
//         redBlue: json["red-blue"] == null
//             ? null
//             : RedBlue.fromJson(json["red-blue"]),
//         yellow:
//             json["yellow"] == null ? null : RedBlue.fromJson(json["yellow"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "red-blue": redBlue?.toJson(),
//         "yellow": yellow?.toJson(),
//       };
// }
//
// class RedBlue {
//   String? backDefault;
//   String? backGray;
//   String? frontDefault;
//   String? frontGray;
//
//   RedBlue({
//     this.backDefault,
//     this.backGray,
//     this.frontDefault,
//     this.frontGray,
//   });
//
//   factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
//         backDefault: json["back_default"],
//         backGray: json["back_gray"],
//         frontDefault: json["front_default"],
//         frontGray: json["front_gray"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "back_default": backDefault,
//         "back_gray": backGray,
//         "front_default": frontDefault,
//         "front_gray": frontGray,
//       };
// }
//
// class GenerationIi {
//   Crystal? crystal;
//   Crystal? gold;
//   Crystal? silver;
//
//   GenerationIi({
//     this.crystal,
//     this.gold,
//     this.silver,
//   });
//
//   factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
//         crystal:
//             json["crystal"] == null ? null : Crystal.fromJson(json["crystal"]),
//         gold: json["gold"] == null ? null : Crystal.fromJson(json["gold"]),
//         silver:
//             json["silver"] == null ? null : Crystal.fromJson(json["silver"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "crystal": crystal?.toJson(),
//         "gold": gold?.toJson(),
//         "silver": silver?.toJson(),
//       };
// }
//
// class Crystal {
//   String? backDefault;
//   String? backShiny;
//   String? frontDefault;
//   String? frontShiny;
//
//   Crystal({
//     this.backDefault,
//     this.backShiny,
//     this.frontDefault,
//     this.frontShiny,
//   });
//
//   factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
//         backDefault: json["back_default"],
//         backShiny: json["back_shiny"],
//         frontDefault: json["front_default"],
//         frontShiny: json["front_shiny"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "back_default": backDefault,
//         "back_shiny": backShiny,
//         "front_default": frontDefault,
//         "front_shiny": frontShiny,
//       };
// }
//
// class GenerationIii {
//   Emerald? emerald;
//   Crystal? fireredLeafgreen;
//   Crystal? rubySapphire;
//
//   GenerationIii({
//     this.emerald,
//     this.fireredLeafgreen,
//     this.rubySapphire,
//   });
//
//   factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
//         emerald:
//             json["emerald"] == null ? null : Emerald.fromJson(json["emerald"]),
//         fireredLeafgreen: json["firered-leafgreen"] == null
//             ? null
//             : Crystal.fromJson(json["firered-leafgreen"]),
//         rubySapphire: json["ruby-sapphire"] == null
//             ? null
//             : Crystal.fromJson(json["ruby-sapphire"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "emerald": emerald?.toJson(),
//         "firered-leafgreen": fireredLeafgreen?.toJson(),
//         "ruby-sapphire": rubySapphire?.toJson(),
//       };
// }
//
// class Emerald {
//   String? frontDefault;
//   String? frontShiny;
//
//   Emerald({
//     this.frontDefault,
//     this.frontShiny,
//   });
//
//   factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
//         frontDefault: json["front_default"],
//         frontShiny: json["front_shiny"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "front_default": frontDefault,
//         "front_shiny": frontShiny,
//       };
// }
//
// class Home {
//   String? frontDefault;
//   dynamic frontFemale;
//   String? frontShiny;
//   dynamic frontShinyFemale;
//
//   Home({
//     this.frontDefault,
//     this.frontFemale,
//     this.frontShiny,
//     this.frontShinyFemale,
//   });
//
//   factory Home.fromJson(Map<String, dynamic> json) => Home(
//         frontDefault: json["front_default"],
//         frontFemale: json["front_female"],
//         frontShiny: json["front_shiny"],
//         frontShinyFemale: json["front_shiny_female"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "front_default": frontDefault,
//         "front_female": frontFemale,
//         "front_shiny": frontShiny,
//         "front_shiny_female": frontShinyFemale,
//       };
// }
//
// class GenerationVii {
//   DreamWorld? icons;
//   Home? ultraSunUltraMoon;
//
//   GenerationVii({
//     this.icons,
//     this.ultraSunUltraMoon,
//   });
//
//   factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
//         icons:
//             json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
//         ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null
//             ? null
//             : Home.fromJson(json["ultra-sun-ultra-moon"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "icons": icons?.toJson(),
//         "ultra-sun-ultra-moon": ultraSunUltraMoon?.toJson(),
//       };
// }
//
// class DreamWorld {
//   String? frontDefault;
//   dynamic frontFemale;
//
//   DreamWorld({
//     this.frontDefault,
//     this.frontFemale,
//   });
//
//   factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
//         frontDefault: json["front_default"],
//         frontFemale: json["front_female"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "front_default": frontDefault,
//         "front_female": frontFemale,
//       };
// }
//
// class GenerationViii {
//   DreamWorld? icons;
//
//   GenerationViii({
//     this.icons,
//   });
//
//   factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
//         icons:
//             json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "icons": icons?.toJson(),
//       };
// }
//
// class Other {
//   DreamWorld? dreamWorld;
//   Home? home;
//   OfficialArtwork? officialArtwork;
//
//   Other({
//     this.dreamWorld,
//     this.home,
//     this.officialArtwork,
//   });
//
//   factory Other.fromJson(Map<String, dynamic> json) => Other(
//         dreamWorld: json["dream_world"] == null
//             ? null
//             : DreamWorld.fromJson(json["dream_world"]),
//         home: json["home"] == null ? null : Home.fromJson(json["home"]),
//         officialArtwork: json["official-artwork"] == null
//             ? null
//             : OfficialArtwork.fromJson(json["official-artwork"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "dream_world": dreamWorld?.toJson(),
//         "home": home?.toJson(),
//         "official-artwork": officialArtwork?.toJson(),
//       };
// }
//
// class OfficialArtwork {
//   String? frontDefault;
//
//   OfficialArtwork({
//     this.frontDefault,
//   });
//
//   factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
//       OfficialArtwork(
//         frontDefault: json["front_default"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "front_default": frontDefault,
//       };
// }
