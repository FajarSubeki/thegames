import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thegames/config/route/route.dart';
import 'package:thegames/config/theme/app_color.dart';
import 'package:thegames/config/theme/app_theme.dart';
import 'package:thegames/feature/game/domain/model/game.dart';

class GameItemWidget extends StatelessWidget {
  const GameItemWidget({super.key, required this.game});
  final GameResults? game;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.gameDetail.name, arguments: game);
      },
      child: Container(
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      game!.backgroundImage,
                      cacheKey: game!.backgroundImage,
                    ),
                    fit: BoxFit.cover,
                    scale: 2.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      game?.name ?? '',
                      style: blackTextStyle.copyWith(
                          color: Colors.black, fontSize: 14, fontWeight: bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: AppColor.kBlackColor,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Release Date',
                      style: blackTextStyle.copyWith(
                          color: Colors.black, fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    game?.released ?? '',
                    style: blackTextStyle.copyWith(
                        color: Colors.black, fontSize: 11, fontWeight: bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Metacritic Score',
                      style: blackTextStyle.copyWith(
                          color: Colors.black, fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    game?.metaCritic.toString() ?? '',
                    style: blackTextStyle.copyWith(
                        color: Colors.black, fontSize: 11, fontWeight: bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
