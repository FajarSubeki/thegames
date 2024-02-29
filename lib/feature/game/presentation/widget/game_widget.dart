import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thegames/core/error/exception.dart';
import 'package:thegames/feature/game/data/model/game_response.dart';
import 'package:thegames/feature/game/presentation/bloc/game_bloc/game_bloc.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({super.key});

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {

  final PagingController<int, GamesResponse> _pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      if (pageKey == 1) return;
      BlocProvider.of<GamesBloc>(context).add(GetGamesEvent(page: pageKey));
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GamesBloc, GamesState>(
      listener: (context, state) {
        if(state.errorMessage is ServerException){
          _pagingController.error = state.errorMessage;
        }

        // _pagingController.value = PagingState(
        //   nextPageKey: state.isLastPage ? null : state.page,
        //   itemList: state.items,
        //   error: state.error,
        // );
      }, builder: (context, state) {

      },
    );
  }
}
