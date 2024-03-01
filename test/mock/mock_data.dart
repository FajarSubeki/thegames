
import 'package:thegames/feature/game/data/model/game_detail_response.dart';
import 'package:thegames/feature/game/data/model/game_response.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/domain/model/game_detail.dart';

GameDetailsResponse mockGameDetailResponse() {
  return const GameDetailsResponse(
      id: 51432,
      name: "The Wolf Among Us 2",
      description: "<p>Play as Bigby, “The Big Bad Wolf” and Sheriff of Fabletown, as you return to a gritty detective noir world where there are no fairy tale endings.</p>\n<p>The Wolf Among Us 2 picks up six months after the events of season one. It’s winter in New York City and a new case threatens to cross the line between Fabletown and the NYPD. How you choose to approach it could determine the future of the Fable community.</p>",
      backgroundImage: "https://media.rawg.io/media/games/845/84539f8f33fea2c753cca0ce3a6d168f.jpg",
      backgroundImageAdditional: "https://media.rawg.io/media/screenshots/e68/e68124234562545bb5c1e374b1f2b3f3.jpg",
      website: "https://www.telltale.com/the-wolf-among-us-2/",
      creatorsCount: 21,
      metaCritic: 0,
      released: "2024-03-01",
      descriptionRaw: "Play as Bigby, “The Big Bad Wolf” and Sheriff of Fabletown, as you return to a gritty detective noir world where there are no fairy tale endings.\r\n\r\nThe Wolf Among Us 2 picks up six months after the events of season one. It’s winter in New York City and a new case threatens to cross the line between Fabletown and the NYPD. How you choose to approach it could determine the future of the Fable community.",
      developers:  [
        Developers(id: 694, name: "Telltale Games", imageBackground: "https://media.rawg.io/media/screenshots/8f3/8f33142dd75fdd6897efc06aadbe7aab.jpg"),
        Developers(id: 9015, name: "Adhoc Games", imageBackground: "https://media.rawg.io/media/screenshots/018/018ba472639339d8d1e6f83ca88b56dd.jpg"),
      ],
      publisher : [
        Publisher(id: 221, name: "Telltale Games", imageBackground: "https://media.rawg.io/media/screenshots/a08/a088fa3ad0e4e0eefd276b587c68e135.jpg"),
        Publisher(id: 40754, name: "LCG Entertainment", imageBackground: "https://media.rawg.io/media/games/845/84539f8f33fea2c753cca0ce3a6d168f.jpg"),
      ]
  );
}

final mockError = Exception('error');

GamesResponse mockResponseList<T>({List<Results>? results, bool isError = false}) {
  return GamesResponse(
    next: "",
    previous: "",
    results: results ?? [],
  );
}

Map<String, dynamic> mockResponseListAsJson<T>(
    {List<T>? results,
      required Object? Function(T results) toJsonT,
      required String next,
      required String previous,
    }) {
  return <String, dynamic>{
    'next': next,
    'previous': previous,
    'result': results?.map(toJsonT).toList(),
  };
}

const mockGameScreenShoot = ShortScreenshotsResults(
    id: 3230873,
    image: "https://media.rawg.io/media/screenshots/d9b/d9b0c27189aa9f3a367ab65e024a2aa5.jpg"
);