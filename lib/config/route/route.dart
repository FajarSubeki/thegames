import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/presentation/page/game_detail_page.dart';
import 'package:thegames/feature/game/presentation/page/home_page.dart';

import 'app_router.dart';
import 'route_definition.dart';

class Routes {
  const Routes._();

  static const home = RouteDefinition(name: '/');
  static const gameDetail = RouteDefinition(name: '/detail_game');
}

class AppRoute {
  const AppRoute._();

  static void initializeAllRoutes(AppRouter appRouter) {
    appRouter
      ..registerRoute(
        Routes.home,
            (_, __) => HomePage(),
      )
      ..registerRoute(
        Routes.gameDetail,
            (_, information) {
          final game = information.argument as GameResults;
          return GameDetailPage(game: game);
        },
      );
  }
}
