import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thegames/config/route/app_router.dart';
import 'package:thegames/config/route/route.dart';
import 'package:thegames/config/theme/app_theme.dart';
import 'injector.dart' as di;
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = sl<AppRouter>();
    AppRoute.initializeAllRoutes(appRouter);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: appRouter.rootNavigationKey,
      initialRoute: Routes.home.name,
      onGenerateRoute: (RouteSettings settings) {
        return appRouter.generateRoute(settings);
      },
    );
  }
}
