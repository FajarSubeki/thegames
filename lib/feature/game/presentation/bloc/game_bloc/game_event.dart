part of 'game_bloc.dart';

abstract class GamesEvent extends Equatable {
  const GamesEvent();
}

class GetGamesEvent extends GamesEvent {

  final int page;

  const GetGamesEvent({this.page = Constants.firstPageKey});

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
