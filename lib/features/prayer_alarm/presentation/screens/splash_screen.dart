import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_alarm/core/helpers/providers/notifier_listener.dart';
import 'package:muslim_alarm/core/router/router_paths.dart';
import 'package:muslim_alarm/features/prayer_alarm/presentation/providers/check_cache_notifier.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final hasCache = ref.read(CheckCacheProvider.provider);
    Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      if (hasCache) {
        context.goNamed(RouterPaths.home.name);
      } else {
        context.goNamed(RouterPaths.settings.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: const Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
