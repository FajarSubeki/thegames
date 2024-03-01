import 'package:intl/intl.dart';
import 'package:thegames/core/error/failure.dart';
import 'package:thegames/core/utils/constants.dart';

String getCurrentDateString() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}

String getOneYearAgoDateString() {
  final DateTime now = DateTime.now();
  final DateTime oneYearAgo = now.subtract(const Duration(days: 365));
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(oneYearAgo);
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure _:
      return Constants.serveFailureMessage;
    default:
      return Constants.unexpectedFailureMessage;
  }
}
