import 'package:dartz/dartz.dart';

import 'package:thegames/core/error/failure.dart';
import 'package:thegames/feature/game/domain/model/game_detail.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/core/params/params.dart';

abstract class GameRepository {

  Future<Either<Failure, List<GameResults>>> getAllGames(Params params);
  Future<Either<Failure, GameDetails>> getGameDetails(GameDetailsParams params);

}