import 'package:flutter/material.dart';

class DashboardAddModal extends StatelessWidget {
  const DashboardAddModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 15,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                    color: Color(0xff6e7191),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Send'),
                    leading: const Icon(
                      Icons.arrow_upward,
                      color: Color(0xff6e7191),
                    ),
                    horizontalTitleGap: 0,
                    onTap: () {
                    },
                  ),
                  ListTile(
                    title: const Text('Receive'),
                    leading: const Icon(
                      Icons.arrow_downward,
                      color: Color(0xff6e7191),
                    ),
                    horizontalTitleGap: 0,
                    onTap: () {
                    },
                  ),
                  ListTile(
                    title: const Text('Exchange'),
                    leading: const Icon(
                      Icons.currency_exchange,
                      color: Color(0xff6e7191),
                    ),
                    horizontalTitleGap: 0,
                    onTap: () {
                    },
                  ),
                  ListTile(
                    title: const Text('QR Scan'),
                    subtitle: const Text('Invoice, addresses'),
                    leading: const Icon(
                      Icons.qr_code,
                      color: Color(0xff6e7191),
                    ),
                    horizontalTitleGap: 0,
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
