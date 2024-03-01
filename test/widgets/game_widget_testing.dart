import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:thegames/feature/game/domain/model/game.dart';
import 'package:thegames/feature/game/presentation/widget/game_item_widget.dart';
import 'package:thegames/feature/game/presentation/widget/game_widget.dart';
import 'package:thegames/feature/game/presentation/bloc/game_bloc/game_bloc.dart';

void main() {
  group('GameWidget', () {
    // Define a mock GamesBloc
    late GamesBloc mockGameBloc;

    setUp(() {
      // Initialize the mock GameBloc
      mockGameBloc = MockGameBloc();
    });

    tearDown(() {
      // Clean up resources
      mockGameBloc.close();
    });

    testWidgets('renders GameItemWidgets', (WidgetTester tester) async {
      // Mock the state for the widget
      when(() => mockGameBloc.state).thenReturn(
        const GamesLoadedState(
          [
            GameResults(id: 1, name: 'Game 1', backgroundImage: '', rating: null, ratingsCount: null, reviewsTextCount: null),
            GameResults(id: 2, name: 'Game 2', backgroundImage: '', rating: null, ratingsCount: null, reviewsTextCount: null),
          ],
          noMoreData: false,
        ) as GamesState Function(),
      );

      // Build our widget and trigger a frame
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockGameBloc,
            child: const GameWidget(
              games: [],
              noMoreData: false,
            ),
          ),
        ),
      );

      // Verify that GameItemWidgets are rendered
      expect(find.byType(GameItemWidget), findsNWidgets(2));
    });

    testWidgets('renders "No Games found" when no games are available',
            (WidgetTester tester) async {
          // Mock the state for the widget
          when(() => mockGameBloc.state).thenReturn(
            const GamesLoadedState(
              [],
              noMoreData: false,
            ) as GamesState Function(),
          );

          // Build our widget and trigger a frame
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider.value(
                value: mockGameBloc,
                child: const GameWidget(
                  games: [],
                  noMoreData: false,
                ),
              ),
            ),
          );

          // Verify that "No Games found" text is rendered
          expect(find.text('No Games found'), findsOneWidget);
        });

    // Add more test cases as needed
  });
}

// Mock class for GameBloc
class MockGameBloc extends MockBloc<GamesEvent, GamesState> implements GamesBloc {}
