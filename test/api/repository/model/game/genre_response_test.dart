import 'package:flutter_test/flutter_test.dart';
import 'package:thegames/feature/game/data/model/game_response.dart';

void main() {

  group('Validate GenreResponse object', () {

    test('fromJson creates GenreResponse object with correct values', () {
      final Map<String, dynamic> json = {
        'id': 4,
        'name': 'Adventure',
        'slug': 'adventure',
      };

      final genre = Genres.fromJson(json);

      expect(genre.id, equals(4));
      expect(genre.name, equals('Adventure'));
      expect(genre.slug, equals('adventure'));
    });

  });

}