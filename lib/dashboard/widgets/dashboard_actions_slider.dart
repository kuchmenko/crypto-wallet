import 'package:flutter/material.dart';

class DashboardActionsSlider extends StatefulWidget {
  const DashboardActionsSlider({super.key});

  @override
  State<DashboardActionsSlider> createState() => _DashboardActionsSliderState();
}

class _DashboardActionsSliderState extends State<DashboardActionsSlider> {
  int selectedIndex = 0;
  final Color activeBackgroundColor = Colors.blueAccent;
  final Color passiveBackgroundColor = Colors.white;
  final Color activeIconColor = Colors.white;
  final Color passiveIconColor = Colors.black;

  List<String> titleList = [
    'Your Address',
    'Aliases',
    'Balances',
    'Rep',
  ];

  List<IconData> iconsList = [
    Icons.widgets,
    Icons.account_circle_outlined,
    Icons.toggle_on_outlined,
    Icons.zoom_in_map,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: iconsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: _ActionItem(
                text: titleList[index],
                icon: Icon(
                  iconsList[index],
                  color: index == selectedIndex
                      ? activeIconColor
                      : passiveIconColor,
                ),
                backgroundColor: index == selectedIndex
                    ? activeBackgroundColor
                    : passiveBackgroundColor,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  const _ActionItem({
    super.key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
  });
  final String text;
  final Icon icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          Text(
            text,
            style: TextStyle(
              color: backgroundColor.computeLuminance() > 0.5
                  ? Colors.grey
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
