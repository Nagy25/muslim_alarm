import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotifierListener<T extends StateNotifier<V>, V> extends ConsumerWidget {
  final Widget child;
  final StateNotifierProvider<T, V> provider;
  final Function(V old, V? value) onChange;
  const NotifierListener(
      {super.key,
      required this.child,
      required this.provider,
      required this.onChange});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<V>(provider, (previous, next) {
      print("vvvvvv $next");
      onChange(next, previous);
    });
    return child;
  }
}
