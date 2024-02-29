import 'package:thegames/feature/game/domain/model/game_detail.dart';


class GameDetailsResponse extends GameDetails {

  const GameDetailsResponse({
    required super.id,
    required super.name,
    required super.description,
    required super.backgroundImage,
    required super.backgroundImageAdditional,
    required super.website,
    required super.creatorsCount,
    required super.metaCritic,
    required super.released,
    required super.descriptionRaw
  });

  factory GameDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GameDetailsResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      backgroundImage: json['background_image'],
      backgroundImageAdditional: json['background_image_additional'],
      website: json['website'],
      creatorsCount: json['creators_count'],
      descriptionRaw: json['description_raw'],
      metaCritic: json['metacritic'],
      released: json['released'],
    );
  }
}