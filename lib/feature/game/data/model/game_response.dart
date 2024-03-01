import 'package:thegames/feature/game/domain/model/game.dart';

class GamesResponse {
  String? next;
  String? previous;
  List<Results>? results;

  GamesResponse({
    this.next,
    this.previous,
    this.results,
  });

  factory GamesResponse.fromJson(Map<String, dynamic> json) {
    return GamesResponse(
        next: json['next'],
        previous: json['previous'],
        results: json['results'] != null ? (json['results'] as List).map((e) => Results.fromJson(e)).toList() : null);
  }
}

class Results extends GameResults {

  const Results(
      {required super.id,
        required super.name,
        required super.released,
        required super.backgroundImage,
        required super.rating,
        required super.ratingsCount,
        required super.reviewsTextCount,
        required super.suggestionsCount,
        required super.updated,
        required super.reviewsCount,
        required List<Genres>? super.genres,
        required super.metaCritic,
        required List<ShortScreenshots>? super.shortScreenshots
      });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      metaCritic: json['metacritic'],
      id: json['id'],
      name: json['name'],
      released: json['released'],
      backgroundImage: json['background_image'],
      rating: json['rating'],
      ratingsCount: json['ratings_count'],
      reviewsTextCount: json['reviews_text_count'],
      suggestionsCount: json['suggestions_count'],
      updated: json['updated'],
      reviewsCount: json['reviews_count'],
      genres: json['genres'] != null
          ? (json['genres'] as List).map((i) => Genres.fromJson(i)).toList()
          : null,
      shortScreenshots: json['short_screenshots'] != null
          ? (json['short_screenshots'] as List)
          .map((i) => ShortScreenshots.fromJson(i))
          .toList()
          : null,
    );
  }
}

class Genres extends GenresResult {

  const Genres(
      {required super.id,
        required super.name,
        required super.slug});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
        id: json['id'],
        name: json['name'],
        slug: json['slug']
    );
  }
}

class ShortScreenshots extends ShortScreenshotsResults {
  const ShortScreenshots({
    required super.id,
    required super.image,
  });

  factory ShortScreenshots.fromJson(Map<String, dynamic> json) {
    return ShortScreenshots(
      id: json['id'],
      image: json['image'],
    );
  }
}