import 'package:account/src/entities/account_balance_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_balance.freezed.dart';

@freezed
class AccountBalance with _$AccountBalance {
  const factory AccountBalance({
    required String id,
    required String accountId,
    required List<AccountBalanceItem> items,
  }) = _AccountBalance;
}
