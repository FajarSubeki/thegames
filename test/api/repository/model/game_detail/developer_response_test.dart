import 'package:flutter_test/flutter_test.dart';
import 'package:thegames/feature/game/data/model/game_detail_response.dart';

void main() {
  group('Validate DeveloperResponse object', () {
    test('fromJson() should return a valid model', () {
      final Map<String, dynamic> json = {
        'id': 123,
        'name': 'John Doe',
        'image_background': 'https://example.com/image.jpg'
      };

      final model = DevelopersResponse.fromJson(json);

      expect(model.id, equals(123));
      expect(model.name, equals('John Doe'));
      expect(model.imageBackground, equals('https://example.com/image.jpg'));
    });
  });
}