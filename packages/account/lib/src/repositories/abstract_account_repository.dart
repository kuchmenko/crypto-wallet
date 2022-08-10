import 'package:account/account.dart';

abstract class AbstractAccountRepository {
  Future<Account> getAccount();
}
