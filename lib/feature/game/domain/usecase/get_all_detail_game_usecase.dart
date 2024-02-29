import 'package:dartz/dartz.dart';

import 'package:thegames/core/error/failure.dart';
import 'package:thegames/core/params/params.dart';
import 'package:thegames/core/usecase/usecase.dart';
import 'package:thegames/feature/game/domain/model/game_detail.dart';
import 'package:thegames/feature/game/domain/repository/game_repository.dart';

class GetGameDetailsUseCase extends UseCase<GameDetails, GameDetailsParams> {
  final GameRepository repository;

  GetGameDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, GameDetails>> call(GameDetailsParams params) async {
    return repository.getGameDetails(
      params,
    );
  }
}
