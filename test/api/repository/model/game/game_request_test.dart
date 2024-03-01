import 'package:flutter_test/flutter_test.dart';
import 'package:thegames/core/params/params.dart';

void main() {
  group('Validate GameRequest object', () {
    test('toJson() returns a valid JSON object with all fields', () {
      final gameRequest = Params(
          apiKey: "9b8ab7bf2f064ff59c6cf6668e6ce8fc",
          page: 2,
          pageSize: 20,
          platforms: 187,
          date: "2023-02-02,2024-02-01",
          ordering: "-released"
      );

      final json = gameRequest.toJson();

      expect(json['apiKey'], "9b8ab7bf2f064ff59c6cf6668e6ce8fc");
      expect(json['page'], 2);
      expect(json['pageSize'], 20);
      expect(json['platforms'], 187);
      expect(json['date'], "2023-02-02,2024-02-01");
      expect(json['ordering'], "-released");
    });

    test('toJson() returns a valid JSON object with default values', () {
      final gameRequest = Params();

      final json = gameRequest.toJson();

      expect(json['apiKey'], "9b8ab7bf2f064ff59c6cf6668e6ce8fc");
      expect(json['page'], 1);
      expect(json['pageSize'], 20);
      expect(json['platforms'], 187);
      expect(json['date'], "2023-03-02,2024-03-01");
      expect(json['ordering'], "-released");
    });
  });
}
