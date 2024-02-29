import 'package:dio/dio.dart';
import 'package:thegames/core/error/exception.dart';
import 'package:thegames/core/utils/constants.dart';
import 'package:thegames/feature/game/data/model/game_detail_response.dart';

abstract class GameDetailsRemoteDataSource {
  Future<GameDetailsResponse> getGameDetails(
      {required int id, required String key});
}

class GameDetailsRemoteDatasourceImpl implements GameDetailsRemoteDataSource {
  final Dio dio;

  GameDetailsRemoteDatasourceImpl(this.dio);

  @override
  Future<GameDetailsResponse> getGameDetails(
      {required int id, required String key}) async {
    try {
      final response =
      await dio.get('${Constants.kBaserUrl}games/$id?key=$key');
      return GameDetailsResponse.fromJson(response.data);
    } catch (exception) {
      throw ServerException(message: exception.toString());
    }
  }
}