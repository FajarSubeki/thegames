import 'package:equatable/equatable.dart';

class GameDetails extends Equatable {
  final int id;
  final String name;
  final String? description;
  final String? backgroundImage;
  final String? backgroundImageAdditional;
  final String? website;
  final int? creatorsCount;
  final String? descriptionRaw;
  final int? metaCritic;
  final String? released;
  final List<Developers>? developers;
  final List<Publisher>? publisher;

  const GameDetails(
      {required this.id,
      required this.name,
      this.description,
      this.backgroundImage,
      this.backgroundImageAdditional,
      this.website,
      this.creatorsCount,
      this.metaCritic,
      this.released,
      this.descriptionRaw,
      this.developers,
      this.publisher});

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        backgroundImage,
        backgroundImageAdditional,
        website,
        creatorsCount,
        descriptionRaw,
        metaCritic,
        released,
        developers,
        publisher
      ];
}

class Developers extends Equatable {
  final int id;
  final String name;
  final String? imageBackground;

  const Developers(
      {required this.id, required this.name, this.imageBackground});

  @override
  List<Object?> get props => [id, name, imageBackground];
}

class Publisher extends Equatable {
  final int id;
  final String name;
  final String? imageBackground;

  const Publisher({required this.id, required this.name, this.imageBackground});

  @override
  List<Object?> get props => [id, name, imageBackground];
}
