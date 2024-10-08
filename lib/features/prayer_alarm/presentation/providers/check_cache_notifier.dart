import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/usecases/check_cache.dart';

mixin CheckCacheProvider {
  static final provider = StateProvider<bool>((ref) {
    final checkCache = ref.watch(CheckCache.provider);
    final data = checkCache.check();
    return data.fold((l) => false, (value) => value);
  });
}
