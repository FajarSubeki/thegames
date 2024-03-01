import 'package:dio/dio.dart';
import 'package:thegames/core/error/exception.dart';
import 'package:thegames/core/utils/constants.dart';
import 'package:thegames/feature/game/data/model/game_response.dart';

abstract class GamesRemoteDataSource {
  Future<GamesResponse> getGames(
      {required String key,
      required int page,
      required int pageSize,
      required int platform,
      required String dates,
      required String ordering});
}

class GamesRemoteDataSourceImpl implements GamesRemoteDataSource {
  final Dio dio;
  GamesRemoteDataSourceImpl(this.dio);

  @override
  Future<GamesResponse> getGames(
      {required String key,
      required int page,
      required int pageSize,
      required int platform,
      required String dates,
      required String ordering}) async {
    try {
      final response = await dio.get(
          '${Constants.kBaserUrl}games?key=$key&page=$page&page_size=$pageSize&platform=$platform&dates=$dates&ordering=$ordering');
      return GamesResponse.fromJson(response.data);
    } catch (exception) {
      throw ServerException(message: exception.toString());
    }
  }
}
