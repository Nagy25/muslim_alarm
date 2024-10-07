import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_alarm/core/router/router_paths.dart';
import 'package:muslim_alarm/features/prayer_alarm/presentation/screens/home_screen.dart';
import 'package:muslim_alarm/features/prayer_alarm/presentation/screens/settings_screen.dart';
import 'package:muslim_alarm/features/prayer_alarm/presentation/screens/splash_screen.dart';

class AppRouter {
  static final provider = Provider((ref) => AppRouter());

  final router = GoRouter(
      routes: RouterPaths.values
          .map((route) => GoRoute(
              path: route.matchAny(any: () => route.path ?? route.name),
              name: route.name,
              builder: (_, state) {
                return route.matchAny(
                  any: () => SizedBox(
                    child: Center(
                      child: Text('un implemented route'),
                    ),
                  ),
                  splash: () => SplashScreen(),
                  home: () => HomeScreen(),
                  settings: () => SettingsScreen(),
                );
              }))
          .toList());
}
