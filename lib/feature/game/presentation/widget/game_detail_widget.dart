import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:thegames/config/theme/app_color.dart';
import 'package:thegames/config/theme/app_theme.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/domain/model/game_detail.dart';
import 'package:thegames/feature/game/presentation/page/screenshoot_page.dart';

class GameDetailWidget extends StatelessWidget {
  final GameResults game;
  final GameDetails gameDetails;

  GameDetailWidget({super.key, required this.game, required this.gameDetails});

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
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                Visibility(
                  visible: game.genres != null && game.genres!.isNotEmpty,
                  child: SizedBox(
                      width: double.infinity,
                      height: 72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Genres',
                            style: blackTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: game.genres?.length,
                                  itemBuilder: (context, index) {
                                    final genre = game.genres![index];
                                    return Container(
                                      margin: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: AppColor.kPrimaryColor),
                                      child: Center(child: Text(
                                        genre.name,
                                        style: blackTextStyle.copyWith(color: Colors.white),
                                      )),
                                    );
                                  })),
                        ],
                      ),
                    ),
                ),
                Container(
                 margin: const EdgeInsets.only(top: 8),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'Description',
                       style: blackTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                     ),
                     const SizedBox(
                       height: 5,
                     ),
                     Text(
                       gameDetails.descriptionRaw!,
                       style: blackTextStyle,
                       textAlign: TextAlign.justify,
                       maxLines: 9,
                       overflow: TextOverflow.ellipsis,
                     ),
                   ],
                 ),
               ),
                Visibility(
                  visible: game.shortScreenshots != null && game.shortScreenshots!.isNotEmpty,
                  child:
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 10),
                      width: double.infinity,
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: Text(
                              'Screenshots',
                              style: blackTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 150,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                ),
                                items: game.shortScreenshots?.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenshotsPage(
                                                      screenshot: i.image),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: const BoxDecoration(
                                            color: AppColor.kDarkGreyColor,
                                          ),
                                          child: Image.network(
                                            i.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ),
                Visibility(
                  visible: game.platforms != null && game.platforms!.isNotEmpty,
                  child: SizedBox(
                      width: double.infinity,
                      height: 72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Platform',
                            style: blackTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: game.platforms?.length,
                                  itemBuilder: (context, index) {
                                    final platform = game.platforms![index];
                                    return Container(
                                      margin: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: AppColor.kPrimaryColor),
                                      child: Center(child: Text(
                                        platform.platform?.name ?? '',
                                        style: blackTextStyle.copyWith(color: Colors.white),
                                      )),
                                    );
                                  })),
                        ],
                      ),
                    ),
                ),
                Visibility(
                  visible: gameDetails.developers != null && gameDetails.developers!.isNotEmpty,
                  child: Container(
                      width: double.infinity,
                      height: 170,
                      margin: const EdgeInsets.only(top: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Developers',
                              style: blackTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: gameDetails.developers!.length,
                              itemBuilder: (context, index) {
                                final developer =
                                gameDetails.developers![index];
                                return Container(
                                    width: 90,
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              developer.imageBackground),
                                        ),
                                        const Spacer(),
                                        Expanded(
                                          child: Text(
                                            developer.name,
                                            style: blackTextStyle.copyWith(fontSize: 13, overflow: TextOverflow.ellipsis,fontWeight: bold),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            softWrap: true,
                                          ),
                                        )
                                      ],
                                    ));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                ),
                Visibility(
                  visible: gameDetails.publisher != null && gameDetails.publisher!.isNotEmpty,
                  child: SizedBox(
                      width: double.infinity,
                      height: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Publishers',
                              style: blackTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: gameDetails.publisher!.length,
                              itemBuilder: (context, index) {
                                final publisher =
                                gameDetails.publisher![index];
                                return Container(
                                    width: 90,
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              publisher.imageBackground),
                                        ),
                                        const Spacer(),
                                        Expanded(
                                          child: Text(
                                            publisher.name,
                                            style: blackTextStyle.copyWith(fontSize: 13, overflow: TextOverflow.ellipsis,fontWeight: bold),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            softWrap: true,
                                          ),
                                        ),
                                      ],
                                    ));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
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
