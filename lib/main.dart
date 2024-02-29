import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thegames/config/route/app_router.dart';
import 'package:thegames/config/route/route.dart';
import 'injector.dart' as di;
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final appRouter = sl.call<AppRouter>;
  AppRoute.initializeAllRoutes(appRouter as AppRouter);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
