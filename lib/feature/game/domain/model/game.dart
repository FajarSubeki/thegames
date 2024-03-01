import 'package:equatable/equatable.dart';

class GameResults extends Equatable {
  final int? id;
  final String? name;
  final String? released;
  final String backgroundImage;
  final double? rating;
  final int? ratingsCount;
  final int? reviewsTextCount;
  final int? suggestionsCount;
  final String? updated;
  final int? reviewsCount;
  final int? metaCritic;
  final List<PlatformsResults>? platforms;
  final List<GenresResult>? genres;
  final List<ShortScreenshotsResults>? shortScreenshots;

  const GameResults(
      {this.id,
      this.name,
      this.released,
      required this.backgroundImage,
      required this.rating,
      required this.ratingsCount,
      required this.reviewsTextCount,
      this.suggestionsCount,
      this.updated,
      this.reviewsCount,
      this.metaCritic,
      this.platforms,
      this.genres,
      this.shortScreenshots});

  @override
  List<Object?> get props => [
        id,
        name,
        released,
        backgroundImage,
        rating,
        ratingsCount,
        reviewsTextCount,
        suggestionsCount,
        updated,
        reviewsCount,
        metaCritic,
        platforms,
        genres,
        shortScreenshots,
      ];

  @override
  bool get stringify => true;
}

class GenresResult extends Equatable {
  final int id;
  final String name;
  final String slug;

  const GenresResult(
      {required this.id, required this.name, required this.slug});

  @override
  List<Object?> get props => [id, name, slug];

  @override
  bool get stringify => true;
}

class ShortScreenshotsResults extends Equatable {
  final int id;
  final String image;

  const ShortScreenshotsResults({required this.id, required this.image});

  @override
  List<Object?> get props => [id, image];
}

class PlatformsResults extends Equatable {
  final PlatformResult? platform;

  const PlatformsResults({this.platform});

  @override
  List<Object?> get props => [platform];

  @override
  bool get stringify => true;
}

class PlatformResult extends Equatable {
  final int? id;
  final String? name;

  const PlatformResult({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];

  @override
  bool get stringify => true;
}
