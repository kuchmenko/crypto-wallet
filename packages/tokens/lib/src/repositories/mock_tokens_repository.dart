import 'package:tokens/src/entities/token.dart';
import 'package:tokens/src/repositories/repositories.dart';

class MockTokensRepository implements AbstractTokensRepository {
  @override
  Future<List<Token>> getTokens() {
    return Future.value([
      const Token(
        id: 'BTC',
        name: 'Bitcoin',
        imageUrl: 'https://via.placeholder.com/150',
        isSusspicious: false,
      ),
      const Token(
        id: 'ETH',
        name: 'Ethereum',
        imageUrl: 'https://via.placeholder.com/150',
        isSusspicious: false,
      ),
      const Token(
        id: 'XRP',
        name: 'Ripple',
        imageUrl: 'https://via.placeholder.com/150',
        isSusspicious: false,
      ),
      const Token(
        id: 'LTC',
        name: 'Litecoin',
        imageUrl: 'https://via.placeholder.com/150',
        isSusspicious: false,
      ),
      const Token(
        id: 'BCH',
        name: 'Bitcoin Cash',
        imageUrl: 'https://via.placeholder.com/150',
        isSusspicious: true,
      ),
      const Token(
        id: 'XLM',
        name: 'Stellar',
        imageUrl: 'https://via.placeholder.com/150',
        isSusspicious: true,
      ),
      const Token(
        id: 'USDT',
        name: 'USD Coin',
        imageUrl: 'https://via.placeholder.com/150',
        isSusspicious: true,
      ),

    ]);
  }
}
