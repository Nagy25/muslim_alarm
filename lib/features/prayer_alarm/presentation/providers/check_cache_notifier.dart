import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/usecases/check_cache.dart';

class CheckCacheNotifier extends StateNotifier<bool> {
  static final provider =
      StateNotifierProvider<CheckCacheNotifier, bool>((ref) {
    return CheckCacheNotifier(checkCache: ref.read(CheckCache.provider));
  });

  final CheckCache checkCache;
  CheckCacheNotifier({required this.checkCache}) : super(false);

  void check() {
    state = checkCache.check();
  }
}
