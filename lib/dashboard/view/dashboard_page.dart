import 'package:account/account.dart';
import 'package:crypto_wallet/dashboard/bloc/bloc.dart';
import 'package:crypto_wallet/dashboard/widgets/dashboard_add_modal.dart';
import 'package:crypto_wallet/dashboard/widgets/widgets.dart';
import 'package:crypto_wallet/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:tokens/tokens.dart';

/// {@template dashboard_page}
/// A description for DashboardPage
/// {@endtemplate}
class DashboardPage extends StatelessWidget {
  /// {@macro dashboard_page}
  const DashboardPage({
    super.key,
  });

  /// The static route for DashboardPage
  static Route<dynamic> route({
    required AbstractAccountRepository accountRepository,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const DashboardPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(
        accountRepository: getIt<AbstractAccountRepository>(),
        tokensRepository: getIt<AbstractTokensRepository>(),
      ),
      child: Scaffold(
        appBar: const DashboardAppBar(),
        body: const DashboardView(),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.repeat_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: Colors.blue,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            )
          ],
          onTap: (index) {
            if (index == 2) {
              _showCustomModalBottomSheet(context);
            }
          },
        ),
      ),
    );
  }

  void _showCustomModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return const DashboardAddModal();
      },
    );
  }
}

/// {@template dashboard_view}
/// Displays the Body of DashboardView
/// {@endtemplate}
class DashboardView extends StatefulWidget {
  /// {@macro dashboard_view}
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();

    context.read<DashboardBloc>().add(const InitializeDashboardEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wallet',
            style: Theme.of(context).textTheme.caption,
          ),
          Row(
            children: [
              Text(
                'Mobile Team',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Icon(
                Icons.unfold_more,
                size: 16,
              ),
            ],
          ),
          const DashboardActionsSlider(),
          const DashboardBody()
        ],
      ),
    );
  }
}
