import 'package:account/account.dart';
import 'package:crypto_wallet/dashboard/dashboard.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:tokens/tokens.dart';

class DashboardTokensSection extends StatelessWidget {
  const DashboardTokensSection({
    super.key,
    required this.tokens,
    required this.items,
    required this.title,
  });

  final List<Token> tokens;
  final List<AccountBalanceItem> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          '$title (${items.length})',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      collapsed: Container(),
      expanded: DashboardTokensList(
        tokens: tokens,
        items: items,
      ),
    );
  }
}
