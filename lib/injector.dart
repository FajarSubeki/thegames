import 'package:thegames/config/route/app_router.dart';
import 'package:thegames/core/network/network.dart';
import 'package:thegames/feature/game/data/datasource/game_detail_remote_data_source.dart';
import 'package:thegames/feature/game/data/datasource/game_remote_data_source.dart';
import 'package:thegames/feature/game/data/repository/game_repository.dart';
import 'package:thegames/feature/game/domain/repository/game_repository.dart';
import 'package:thegames/feature/game/domain/usecase/get_all_game_usecase.dart';
import 'package:thegames/feature/game/domain/usecase/get_detail_game_usecase.dart';
import 'package:thegames/feature/game/presentation/bloc/game_detail_bloc/game_detail_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'feature/game/presentation/bloc/game_bloc/game_bloc.dart';

final sl = GetIt.instance;
GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  initFeatures();

  initCore();
  await initExternal();
}

void initFeatures() {
  //Bloc
  sl.registerFactory(() => GamesBloc(sl()));
  sl.registerFactory(() => GameDetailsBloc(sl()));

  //Use case
  sl.registerLazySingleton(() => GetAllGamesUseCase(sl()));
  sl.registerLazySingleton(() => GetGameDetailsUseCase(sl()));

  //Repository
  sl.registerLazySingleton<GameRepository>(() => GamesRepositoryImpl(
    gamesRemoteDataSource: sl(),
    networkInfo: sl(),
    gameDetailsRemoteDataSource: sl(),
  ));

  //Data source
  sl.registerLazySingleton<GamesRemoteDataSource>(
          () => GamesRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<GameDetailsRemoteDataSource>(
          () => GameDetailsRemoteDatasourceImpl(sl()));
}

void initCore() {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => AppRouter());

}

Future<void> initExternal() async {
  //Dio
  sl.registerLazySingleton(() => Dio());

  //Network info
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
