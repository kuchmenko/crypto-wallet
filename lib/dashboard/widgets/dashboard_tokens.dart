import 'package:account/account.dart';
import 'package:crypto_wallet/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:tokens/tokens.dart';

class DashboardTokens extends StatelessWidget {
  const DashboardTokens({
    super.key,
    required this.account,
    required this.tokens,
  });

  final Account account;
  final List<Token> tokens;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final balanceItems = account.balance.items;
        final filteredTokens = balanceItems.where(
          (element) => !element.isHidden && !_isBalanceItemSuspicious(element),
        ).toList();
        final hiddenTokens = balanceItems.where(
          (element) => element.isHidden,
        ).toList();
        final suspiciousTokens = balanceItems.where(
          (element) => !element.isHidden && _isBalanceItemSuspicious(element),
        ).toList();

        return ListView(
          shrinkWrap: true,
          children: [
            const DashboardTokensSearch(),
            const SizedBox(height: 8),
            DashboardTokensList(
              tokens: tokens,
              items: filteredTokens,
            ),
            const SizedBox(height: 8),
            // Hidden section
            DashboardTokensSection(
              tokens: tokens,
              items: hiddenTokens,
              title: 'Hidden',
            ),
            const SizedBox(height: 8),
            // Suspicious section
            DashboardTokensSection(
              tokens: tokens,
              items: suspiciousTokens,
              title: 'Suspicious',
            ),
          ],
        );
      },
    );
  }

  bool _isBalanceItemSuspicious(AccountBalanceItem balanceItem) {
    return tokens.indexWhere((element) =>
            element.id == balanceItem.currency && element.isSusspicious,) !=
        -1;
  }
}
