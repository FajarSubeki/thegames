import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thegames/core/error/failure.dart';
import 'package:thegames/core/params/params.dart';
import 'package:thegames/core/utils/constants.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/domain/usecase/get_all_game_usecase.dart';

part 'game_event.dart';
part 'game_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GetAllGamesUseCase getGamesUseCase;
  GamesBloc(this.getGamesUseCase) : super(GamesInitialState()) {
    on<GamesEvent>(getGamesEventObserver);
  }

  int page = 1;
  static const int pageSize = 20;
  final List<GameResults> _games = [];

  Future<void> getGamesEventObserver(event, emit) async {
    if (event is GetGamesEvent) {
      emit(GamesLoadingState());
      final result =
          await getGamesUseCase(Params(page: page, pageSize: pageSize));
      result.fold(
          (failure) =>
              emit(GamesErrorState(error: mapFailureToMessage(failure))),
          (games) {
        if (games.isNotEmpty) {
          final noMoreData = games.length < pageSize;
          _games.addAll(games);
          page++;
          emit(GamesLoadedState(_games, noMoreData: noMoreData));
        } else {
          emit(GamesErrorState(error: Constants.unexpectedFailureMessage));
        }
      });
    } else if (event is RefreshGamesEvent) {
      page = 1;
      _games.clear();
      getGamesEventObserver(GetGamesEvent(), emit);
    } else {
      emit(GamesErrorState(error: Constants.unexpectedFailureMessage));
    }
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return Constants.serveFailureMessage;
      default:
        return Constants.unexpectedFailureMessage;
    }
  }
}
