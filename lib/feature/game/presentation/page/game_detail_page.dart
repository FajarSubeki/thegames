import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thegames/core/widget/loading_widget.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/presentation/bloc/game_detail_bloc/game_detail_bloc.dart';
import 'package:thegames/feature/game/presentation/page/home_page.dart';
import 'package:thegames/feature/game/presentation/widget/game_detail_widget.dart';
import 'package:thegames/injector.dart';

class GameDetailPage extends StatelessWidget {
  final GameResults game;

  GameDetailPage({super.key, required this.game});

  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  MultiBlocProvider buildBody(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<GameDetailsBloc>(),
          ),
        ],
        child: BlocBuilder<GameDetailsBloc, GameDetailsState>(
          builder: (context, state) {
            blocContext = context;
            if (state is GameDetailsInitialState) {
              dispatchGetGameDetailsEvent(context);
            }
            if (state is GameDetailsLoadingState) {
              return const Center(child: LoadingWidget());
            } else if (state is GameDetailsLoadedState) {
              final gameDetails = state.gameDetails;
              return GameDetailWidget(
                gameDetails: gameDetails,
                game: game
              );
            } else if (state is GameDetailsErrorState) {
              return ErrorMessageWidget(message: state.message);
            } else {
              return const ErrorMessageWidget(
                  message: 'An unknown error occurred');
            }
          },
        ));
  }

  void dispatchGetGameDetailsEvent(BuildContext context) {
    BlocProvider.of<GameDetailsBloc>(context)
        .add(GetGameDetailsEvent(id: game.id!));
  }
}
