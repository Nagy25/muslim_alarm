// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_paths.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension RouterPathsMatch on RouterPaths {
  T match<T>(
      {required T Function() splash,
      required T Function() home,
      required T Function() settings}) {
    final v = this;
    if (v == RouterPaths.splash) {
      return splash();
    }

    if (v == RouterPaths.home) {
      return home();
    }

    if (v == RouterPaths.settings) {
      return settings();
    }

    throw Exception('RouterPaths.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? splash,
      T Function()? home,
      T Function()? settings}) {
    final v = this;
    if (v == RouterPaths.splash && splash != null) {
      return splash();
    }

    if (v == RouterPaths.home && home != null) {
      return home();
    }

    if (v == RouterPaths.settings && settings != null) {
      return settings();
    }

    return any();
  }
}
