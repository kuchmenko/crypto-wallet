import 'package:account/src/entities/entities.dart';
import 'package:account/src/repositories/abstract_account_repository.dart';

class MockAccountRepository implements AbstractAccountRepository {
  @override
  Future<Account> getAccount() {
    return Future.value(
      const Account(
        id: '1',
        email: 'ivan@kuchmenko.com',
        photoUrl:
            'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
        displayName: 'Ivan Kuchmenko',
        balance: AccountBalance(id: '1', accountId: '1', items: [
          AccountBalanceItem(
            id: '1',
            currency: 'USDT',
            balance: 100,
            isHidden: false,
          ),
          AccountBalanceItem(
            id: '2',
            currency: 'BTC',
            balance: 0,
            isHidden: false,
          ),
          AccountBalanceItem(
            id: '3',
            currency: 'ETH',
            balance: 100,
            isHidden: false,
          ),
          AccountBalanceItem(
            id: '4',
            currency: 'LTC',
            balance: 0,
            isHidden: true,
          ),
        ],),
      ),
    );
  }
}
