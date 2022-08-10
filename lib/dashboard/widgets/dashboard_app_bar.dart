import 'package:crypto_wallet/dashboard/bloc/bloc.dart';
import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key, this.height = kToolbarHeight});

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final account = state is DashboardLoaded ? state.account : null;

        return AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[50],
          leading: account != null
              ? IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, '/account');
                  },
                )
              : null,
          actions: [
            if (account != null)
              Container(
                margin: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: NetworkImage(
                      account.photoUrl,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
