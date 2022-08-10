import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_balance_item.freezed.dart';

@freezed
class AccountBalanceItem with _$AccountBalanceItem {
  const factory AccountBalanceItem({
    required String id,
    required String currency,
    required double balance,
    required bool isHidden,
  }) = _AccountBalanceItem;
}
