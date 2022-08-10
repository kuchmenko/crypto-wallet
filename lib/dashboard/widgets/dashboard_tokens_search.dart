import 'package:flutter/material.dart';

class DashboardTokensSearch extends StatelessWidget {
  const DashboardTokensSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: InputBorder.none,
                        ),
                        onSubmitted: print,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () {
                print('Search');
              },
            ),
          ],
        ),
      ),
    );
  }
}
