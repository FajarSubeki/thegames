import 'package:flutter_test/flutter_test.dart';
import 'package:thegames/feature/game/data/model/game_detail_response.dart';

void main() {
  group('Validate GameDetailResponse object', () {

    const id = 1;
    const name = 'Game Name';
    const metacritic = 85;
    const imageUrl = 'https://example.com/image.jpg';
    const description = 'Game description';
    const descriptionRaw = 'Game description Raw';
    final releaseDate = DateTime.now().toString();
    const website = 'https://example.com';

    test('fromJson creates correct instance', () {
      // Assert
      final json = <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'metacritic': metacritic,
        'background_image': imageUrl,
        'description_raw': descriptionRaw,
        'released': releaseDate.toString(),
        'website': website,
        'developers': [],
        'publishers': [],
      };

      // Act
      final result = GameDetailsResponse.fromJson(json);

      // Assert
      expect(result.id, equals(id));
      expect(result.name, equals(name));
      expect(result.description, equals(description));
      expect(result.metaCritic, equals(metacritic));
      expect(result.backgroundImage, equals(imageUrl));
      expect(result.descriptionRaw, equals(descriptionRaw));
      expect(result.released, equals(releaseDate));
      expect(result.website, equals(website));
      expect(result.developers, []);
      expect(result.publisher, []);
    });

  });
}