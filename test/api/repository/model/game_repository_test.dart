import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:thegames/core/params/params.dart';
import 'package:thegames/feature/game/data/model/game_response.dart';
import 'package:thegames/feature/game/domain/repository/game_repository.dart';

import '../../../mock/mock.dart';
import '../../../mock/mock.mork.dart';

void main() {
  late MockGameRepository mockRepository;

  group('GameRepository', (){
    setUpAll(() {
      initMockDependencies();
      mockRepository =
      serviceLocatorTest<GameRepository>() as MockGameRepository;
    });

    test('getListOfGames returns a GameResponse', () async {
      final param = Params(apiKey: "");
      final expectedResponse = GamesResponse(
          next: "",
          previous: "",
          results: [const Results(id: 1, name: 'Game 1', released: '', backgroundImage: '',
          rating: 0, ratingsCount: 0, reviewsTextCount: 0, suggestionsCount: 0,
          updated: '', reviewsCount: 0, platforms: [], genres: [], metaCritic: 0, shortScreenshots: [])]
      );

      when(mockRepository.getListOfGames(param)).thenAnswer(
            (_) => Future.value(expectedResponse),
      );

      final response = await mockRepository.getListOfGames(param);

      expect(response, expectedResponse);
    });

  });
}