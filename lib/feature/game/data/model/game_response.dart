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
  const Results({
    required super.id,
    required super.name,
    required super.released,
    required super.backgroundImage,
    required super.rating,
    required super.ratingsCount,
    required super.reviewsTextCount,
    required super.suggestionsCount,
    required super.updated,
    required super.reviewsCount,
    required super.metaCritic,
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
    );
  }
}