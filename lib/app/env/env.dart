import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'TMDB_TOKEN')
  static const String tmdbToken = _Env.tmdbToken;
}
