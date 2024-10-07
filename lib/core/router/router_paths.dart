import 'package:match/match.dart';

part 'router_paths.g.dart';

@match
enum RouterPaths {
  splash(path: '/'),
  home,
  settings;

  final String? path;
  const RouterPaths({this.path});
}
