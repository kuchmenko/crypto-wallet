import 'package:account/src/entities/account_balance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  const factory Account({
    required String id,
    required String email,
    required String photoUrl,
    required String displayName,
    required AccountBalance balance,
  }) = _Account;
}
