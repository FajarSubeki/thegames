import 'package:thegames/feature/game/data/model/game_detail_response.dart';
import 'package:thegames/feature/game/data/model/game_response.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/domain/model/game_detail.dart';

GameResults fromResultResponseToDomain(Results results){
  return GameResults(
      id: results.id!,
      name: results.name!,
      released: results.released!,
      backgroundImage: results.backgroundImage,
      rating: results.rating!,
      ratingsCount: results.ratingsCount!,
      reviewsTextCount: results.reviewsTextCount!,
      suggestionsCount: results.suggestionsCount!,
      updated: results.updated!,
      reviewsCount: results.reviewsCount!,
      metaCritic: results.metaCritic ?? 0,
      genres: results.genres,
      shortScreenshots: results.shortScreenshots
  );
}

GameDetails fromGameDetailsResponseToDomain(GameDetailsResponse response){
  return GameDetails(
      id: response.id,
      name: response.name,
      backgroundImage: response.backgroundImage!,
      backgroundImageAdditional: response.backgroundImageAdditional ?? '',
      descriptionRaw: response.descriptionRaw!,
      description: response.description!,
      website: response.website!,
      creatorsCount: response.creatorsCount!,
      developers: response.developers,
  );
}
