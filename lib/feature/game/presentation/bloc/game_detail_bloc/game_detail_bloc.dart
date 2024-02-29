import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:thegames/core/params/params.dart';
import 'package:thegames/feature/game/domain/usecase/get_detail_game_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:thegames/core/utils/utils.dart';
import 'package:thegames/feature/game/domain/model/game_detail.dart';

part 'game_detail_event.dart';
part 'game_detail_state.dart';

class GameDetailsBloc extends Bloc<GameDetailsEvent, GameDetailsState> {
  final GetGameDetailsUseCase getGameDetailsUseCase;
  GameDetailsBloc(this.getGameDetailsUseCase) : super(GameDetailsInitialState()) {
    on<GetGameDetailsEvent>(getGameDetailsEventObserver,);
  }

  Future<void> getGameDetailsEventObserver(GetGameDetailsEvent event, Emitter<GameDetailsState> emit) async {
    emit(GameDetailsLoadingState());
    final result = await getGameDetailsUseCase(GameDetailsParams(id: event.id));
    result.fold(
          (failure) => emit(GameDetailsErrorState(message: mapFailureToMessage(failure))),
          (gameDetails) {
        return emit(GameDetailsLoadedState(gameDetails: gameDetails));
      },
    );
  }



}