part of 'game_bloc.dart';

abstract class GamesEvent extends Equatable {
  const GamesEvent();
}

class GetGamesEvent extends GamesEvent {
  @override
  List<Object?> get props => [];
}

class RefreshGamesEvent extends GamesEvent {
  @override
  List<Object?> get props => [];
}

class HideAppBarEvent extends GamesEvent {
  @override
  List<Object?> get props => [];
}
