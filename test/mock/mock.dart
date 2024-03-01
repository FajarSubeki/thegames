import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:thegames/feature/game/domain/repository/game_repository.dart';

import 'mock.mork.dart';

GetIt serviceLocatorTest = GetIt.instance;

void initMockDependencies() {
  serviceLocatorTest.allowReassignment = true;

  serviceLocatorTest
      .registerLazySingleton<BuildContext>(() => MockBuildContext());
  serviceLocatorTest
      .registerLazySingleton<GameRepository>(() => MockGameRepository());

}
