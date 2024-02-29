import 'package:dartz/dartz.dart';
import 'package:thegames/core/error/failure.dart';
import 'package:thegames/core/usecase/usecase.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/domain/repository/game_repository.dart';
import 'package:thegames/core/params/params.dart';

class GetAllGamesUseCase extends UseCase<List<GameResults>, Params> {
  final GameRepository repository;

  GetAllGamesUseCase(this.repository);

  @override
  Future<Either<Failure, List<GameResults>>> call(Params params) async {
    return repository.getAllGames(params);
  }
}
