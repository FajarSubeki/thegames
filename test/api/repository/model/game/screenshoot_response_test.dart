import 'package:flutter_test/flutter_test.dart';
import 'package:thegames/feature/game/data/model/game_response.dart';

void main() {

  group('Validate ScreenshootResponse object', () {

    test('fromJson creates ScreenshootResponse object with correct values', () {
      final Map<String, dynamic> json = {
        'id': 2,
        'image': 'https://example.com/image.jpg',
      };

      final screenshoot = ShortScreenshots.fromJson(json);

      expect(screenshoot.id, equals(2));
      expect(screenshoot.image, equals('https://example.com/image.jpg'));
    });

  });

}