import 'package:account/account.dart';
import 'package:flutter/material.dart';
import 'package:tokens/tokens.dart';

class DashboardTokensList extends StatelessWidget {
  const DashboardTokensList({
    super.key,
    required this.items,
    required this.tokens,
  });

  final List<AccountBalanceItem> items;
  final List<Token> tokens;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Container(
        height: 8,
      ),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final token = tokens.firstWhere((e) => e.id == item.currency);
        return Material(
          elevation: 1,
          child: ListTile(
            minVerticalPadding: 16,
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: Image(
              image: NetworkImage(
                token.imageUrl,
              ),
            ),
            title: Text(token.name),
            subtitle: Text(item.balance.toString()),
          ),
        );
      },
    );
  }
}
