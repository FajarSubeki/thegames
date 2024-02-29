import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:thegames/config/theme/app_color.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/domain/model/game_detail.dart';

class GameDetailWidget extends StatelessWidget {
  final GameResults game;
  final GameDetails gameDetails;

  GameDetailWidget({Key? key, required this.game, required this.gameDetails})
      : super(key: key);

  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
        title: Container(
      margin: const EdgeInsets.only(top: 10),
      child: const Text('Games'),
    ));
  }

  Widget buildBody(BuildContext context) {
    return CustomScrollView(shrinkWrap: true, slivers: [
      SliverAppBar(
          pinned: true,
          title: Text(gameDetails.name),
          actions: buildAppBarActions(context),
          expandedHeight: 270.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: gameDetails.backgroundImageAdditional ?? '',
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColor.kDarkGreyColor, Colors.transparent])),
                  ),
                ),
                Positioned(
                    top: 150,
                    left: 120,
                    right: 120,
                    bottom: 30,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  gameDetails.backgroundImage ?? '',
                                  cacheKey: gameDetails.backgroundImage),
                              fit: BoxFit.cover,
                              scale: 1.0,
                            ),
                            color: AppColor.kDarkGreyColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColor.kDarkGreyColor,
                                      Colors.transparent
                                    ])),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    gameDetails.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black,
                                          offset: Offset(5.0, 5.0),
                                        ),
                                      ],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
            collapseMode: CollapseMode.parallax,
          )),
      SliverFillRemaining(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          'Genres',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                      // Expanded(
                      //     child: ListView.builder(
                      //         scrollDirection: Axis.horizontal,
                      //         itemCount: game.genres?.length,
                      //         itemBuilder: (context, index) {
                      //           final genre = game.genres![index];
                      //           return Container(
                      //             margin: const EdgeInsets.all(5),
                      //             padding: const EdgeInsets.all(5),
                      //             decoration: BoxDecoration(
                      //                 borderRadius:
                      //                 BorderRadius.circular(5),
                      //                 color: AppColor.kDarkGreyColor),
                      //             child: Center(child: Text(genre.name)),
                      //           );
                      //         })),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }

  //Build app bar actions
  List<Widget> buildAppBarActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.share),
        onPressed: () {
          Share.share('Check out this game ${game.name}');
        },
      ),
    ];
  }
}
