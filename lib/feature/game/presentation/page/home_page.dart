import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thegames/core/widget/loading_widget.dart';
import 'package:thegames/feature/game/presentation/bloc/game_bloc/game_bloc.dart';
import 'package:thegames/feature/game/presentation/widget/game_widget.dart';
import 'package:thegames/injector.dart';

class HomePage extends StatelessWidget {

  HomePage({super.key});

  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  BlocProvider<GamesBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<GamesBloc>(),
        child: BlocBuilder<GamesBloc, GamesState>(
          builder: (context, state) {
            blocContext = context;

            if (state is GamesInitialState) {
              dispatchEvent(context);
            }
            if (state is GamesLoadingState) {
              return const Center(child: LoadingWidget());
            } else if (state is GamesLoadedState) {
              final games = state.games;
              final noMoreData = state.noMoreData;
              return GameWidget(
                games: games,
                noMoreData: noMoreData,
              );
            } else if (state is GamesErrorState) {
              return ErrorMessageWidget(message: state.errorMessage!);
            } else {
              return const ErrorMessageWidget(
                  message: 'An unknown error occurred');
            }
          },
        ));
  }


  void dispatchEvent(BuildContext context) {
    BlocProvider.of<GamesBloc>(context).add(GetGamesEvent());
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