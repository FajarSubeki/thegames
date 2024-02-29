import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thegames/core/error/exception.dart';
import 'package:thegames/core/widget/loading_widget.dart';
import 'package:thegames/feature/game/data/model/game_response.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/presentation/bloc/game_bloc/game_bloc.dart';
import 'package:thegames/feature/game/presentation/widget/game_item_widget.dart';
import 'package:thegames/injector.dart';

class GameWidget extends StatefulWidget {

  const GameWidget({
    super.key,
    required this.games,
    required this.noMoreData,
  });

  final List<GameResults?> games;
  final bool noMoreData;


  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {

  // final PagingController<int, GamesResponse> _pagingController =
  // PagingController(firstPageKey: 1);
  //
  // @override
  // void initState() {
  //   _pagingController.addPageRequestListener((pageKey) {
  //     if (pageKey == 1) return;
  //     BlocProvider.of<GamesBloc>(context).add(GetGamesEvent(page: pageKey));
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _pagingController.dispose();
  //   super.dispose();
  // }

  late ScrollController scrollController;

  double scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController
        .addListener(() => onScrollListener(context, scrollController));
  }

  void onScrollListener(
      BuildContext context, ScrollController scrollController) {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      scrollPosition = scrollController.position.pixels;
      BlocProvider.of<GamesBloc>(context).add(GetGamesEvent());
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void jumpToScrollPosition() {
    scrollController.jumpTo(scrollPosition);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.games.isEmpty) {
      return const Center(child: Text('No Games found'));
    }
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification &&
              scrollNotification.metrics.extentAfter == 0) {
            jumpToScrollPosition();
            BlocProvider.of<GamesBloc>(context).add(GetGamesEvent());
          }
          return false;
        },
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 7,
          ),
          controller: scrollController,
          itemCount: widget.games.length,
          itemBuilder: (context, index) {
            final game = widget.games[index];
            return GameItemWidget(
              game: game,
            );
          },
        ),
      ),
    );
  }

}
