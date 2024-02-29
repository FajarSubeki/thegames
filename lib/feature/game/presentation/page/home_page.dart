import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thegames/feature/game/presentation/bloc/game_bloc/game_bloc.dart';
import 'package:thegames/injector.dart';

class HomePage extends StatelessWidget {

  HomePage({super.key});

  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<GamesBloc>(),
        child: BlocBuilder<GamesBloc, GamesState>(
          builder: (context, state) {
            blocContext = context;

            if (state is GamesInitialState) {
              dispatchEvent(context);
            }
            if (state is GamesLoadingState) {
              return const ErrorMessageWidget(message: 'An unknown error occurred');
            } else if (state is GamesLoadedState) {
              final games = state.games;
              final noMoreData = state.noMoreData;
              print("test");
              // return GenresListWidget(
              //   games: games,
              //   noMoreData: noMoreData,
              // );
              return const ErrorMessageWidget(message: 'Success');
            } else if (state is GamesErrorState) {
              return const ErrorMessageWidget(message: 'An unknown error occurred');
            } else {
              return const ErrorMessageWidget(message: 'An unknown error occurred');
            }
          },
        ));
  }

  void dispatchEvent(BuildContext context) {
    BlocProvider.of<GamesBloc>(context).add(const GetGamesEvent());
  }

}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: (Text(message)));
  }
}