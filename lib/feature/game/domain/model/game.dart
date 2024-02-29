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
      });

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
    metaCritic
  ];

  @override
  bool get stringify => true;
}