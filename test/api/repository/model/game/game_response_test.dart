import 'package:flutter_test/flutter_test.dart';
import 'package:thegames/feature/game/data/model/game_response.dart';

void main() {
  group('Validate GameResponse object', () {
    test('fromJson() should return a valid GameResponse object', () {
      final json = {
        'id': 123,
        'name': 'My Game',
        'genres': [],
        'metacritic': 80,
        'background_image': 'https://example.com/image.jpg',
        'rating': 8.5,
      };

      final response = Results.fromJson(json);

      expect(response.id, equals(123));
      expect(response.name, equals('My Game'));
      expect(response.genres, isEmpty);
      expect(response.metaCritic, equals(80));
      expect(response.backgroundImage, equals('https://example.com/image.jpg'));
      expect(response.rating, equals(8.5));
    });
  });
}
