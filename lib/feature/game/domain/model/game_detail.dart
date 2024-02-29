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
        this.descriptionRaw
      });

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
    released
  ];
}