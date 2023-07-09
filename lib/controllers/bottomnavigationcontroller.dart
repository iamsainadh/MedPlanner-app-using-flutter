import 'package:flutter/material.dart';

class TabBarMatrerialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const TabBarMatrerialWidget(
      {super.key, required this.index, required this.onChangedTab});

  @override
  State<TabBarMatrerialWidget> createState() => _TabBarMatrerialWidgetState();
}

class _TabBarMatrerialWidgetState extends State<TabBarMatrerialWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: const CircularNotchedRectangle(),
      color: Colors.black87,
      child: SizedBox(
        height: 80,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          buildTabItem(
            index: 0,
            icon: const Icon(Icons.home),
          ),
          buildTabItem(
            index: 1,
            icon: const Icon(Icons.phone),
          ),
          buildTabItem(
            index: 2,
            icon: const Icon(Icons.map),
          ),
          buildTabItem(
            index: 3,
            icon: const Icon(Icons.settings),
          ),
        ]),
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
  }) {
    final isSelected = index == widget.index;
    return IconTheme(
        data: IconThemeData(color: isSelected ? Colors.white : Colors.blue),
        child: IconButton(
            icon: icon, onPressed: () => widget.onChangedTab(index)));
  }
}
