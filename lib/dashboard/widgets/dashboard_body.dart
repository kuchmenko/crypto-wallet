import 'package:crypto_wallet/dashboard/bloc/bloc.dart';
import 'package:crypto_wallet/dashboard/widgets/dashboard_tokens.dart';
import 'package:flutter/material.dart';

/// {@template dashboard_body}
/// Body of the DashboardPage.
///
/// Add what it does
/// {@endtemplate}
class DashboardBody extends StatelessWidget {
  /// {@macro dashboard_body}
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => current is DashboardLoaded,
      builder: (context, state) {
        final account = state is DashboardLoaded ? state.account : null;
        final tokens = state is DashboardLoaded ? state.tokens : null;
        final canDisplayTokens = account != null && tokens != null;

        return Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: const EdgeInsets.only(right: 24),
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    tabs: [
                      Text(
                        'Tokens',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      Text(
                        'Leasing',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    if (canDisplayTokens) DashboardTokens(
                            account: account,
                            tokens: tokens,
                          ) else Container(),
                    Container(
                      child: const Text('Leasing'),
                    ),
                  ],),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
