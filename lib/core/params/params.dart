import 'package:equatable/equatable.dart';
import 'package:thegames/core/utils/constants.dart';
import 'package:thegames/core/utils/utils.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Params extends Equatable {
  final String apiKey;
  final int page;
  final int pageSize;
  final int platforms;
  final String date;
  final String ordering;

  Params({
    String? apiKey,
    int? page,
    int? pageSize,
    int? platforms,
    String? date,
    String? ordering,
  })  : apiKey = apiKey ?? Constants.apiKey,
        page = page ?? 1,
        pageSize = pageSize ?? 20,
        platforms = platforms ?? 187,
        date = date ?? "${getOneYearAgoDateString()},${getCurrentDateString()}",
        ordering = ordering ?? "-released";

  @override
  List<Object?> get props => [
    apiKey,
    page,
    pageSize,
  ];
}

class GameDetailsParams extends Equatable {
  final String apiKey;
  final int id;
  final List<int> ids;

  const GameDetailsParams({
    this.apiKey = Constants.apiKey,
    required this.id,
    this.ids = const [],
  });
  @override
  List<Object?> get props => [
    apiKey,
    id,
    ids,
  ];
}