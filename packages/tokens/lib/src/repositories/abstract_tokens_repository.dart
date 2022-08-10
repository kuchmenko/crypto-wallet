import 'package:tokens/src/entities/entities.dart';

abstract class AbstractTokensRepository {
  Future<List<Token>> getTokens();
}
