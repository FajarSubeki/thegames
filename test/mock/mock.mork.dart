import 'package:thegames/feature/game/domain/repository/game_repository.dart' as gr;
import 'package:mockito/mockito.dart' as mockito;
import 'package:thegames/feature/game/domain/model/game.dart' as gro;
import 'package:thegames/feature/game/data/model/game_response.dart' as gres;
import 'package:thegames/core/params/params.dart' as pr;
import 'dart:async' as da;
import 'package:flutter/material.dart' as material;

class MockGameRepository extends mockito.Mock implements gr.GameRepository {

  MockGameRepository() {
    mockito.throwOnMissingStub(this);
  }

  @override
  da.Future<gres.GamesResponse> getListOfGames(
      pr.Params? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #getListOfGames,
          [request],
        ),
        returnValue: da.Future<gres.GamesResponse>.value(
            _FakeResponseList_3<gro.GameResults>(
              this,
              Invocation.method(
                #getListOfGames,
                [request],
              ),
            )),
      ) as da.Future<gres.GamesResponse>);

}

class _FakeResponseList_3<T> extends mockito.SmartFake
    implements gres.GamesResponse {
  _FakeResponseList_3(
      Object parent,
      Invocation parentInvocation,
      ) : super(
    parent,
    parentInvocation,
  );
}

class MockBuildContext extends mockito.Mock implements material.BuildContext {
  MockBuildContext() {
    mockito.throwOnMissingStub(this);
  }
}
