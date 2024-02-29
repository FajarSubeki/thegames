import 'package:intl/intl.dart';

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