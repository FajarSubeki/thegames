import 'package:dartz/dartz.dart';
import 'package:thegames/core/error/failure.dart';
import 'package:thegames/core/network/network.dart';
import 'package:thegames/core/params/params.dart';
import 'package:thegames/core/utils/constants.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/domain/model/game_detail.dart';
import 'package:thegames/feature/game/data/datasource/game_remote_data_source.dart';
import 'package:thegames/feature/game/data/datasource/game_detail_remote_data_source.dart';
import 'package:thegames/feature/game/domain/repository/game_repository.dart';
import 'package:thegames/core/error/exception.dart';
import 'package:thegames/feature/game/data/mappers/mappers.dart';

class GamesRepositoryImpl implements GameRepository {

  final GamesRemoteDataSource gamesRemoteDataSource;
  final GameDetailsRemoteDataSource gameDetailsRemoteDataSource;

  final NetworkInfo networkInfo;

  GamesRepositoryImpl({
    required this.gamesRemoteDataSource,
    required this.gameDetailsRemoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<GameResults>>> getAllGames(Params params) async {
    if (await networkInfo.isConnected()) {
      try {
        final remoteData = await gamesRemoteDataSource.getGames(
          key: params.apiKey,
          page: params.page,
          pageSize: params.pageSize,
          platform: params.platforms,
          dates: params.date,
          ordering: params.ordering,
        );

        final gameResults = remoteData.results
            ?.map((e) => fromResultResponseToDomain(e))
            .toList() ?? [];

        return Right(gameResults);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(ServerFailure(Constants.noInternetMessage));
    }
  }

  @override
  Future<Either<Failure, GameDetails>> getGameDetails(GameDetailsParams params) async {
    if (await networkInfo.isConnected()) {
      try {
        final remoteData = await gameDetailsRemoteDataSource.getGameDetails(
            id: params.id, key: params.apiKey);
        final gameResults = fromGameDetailsResponseToDomain(remoteData);
        return Right(gameResults);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(ServerFailure(Constants.noInternetMessage));
    }
  }


}