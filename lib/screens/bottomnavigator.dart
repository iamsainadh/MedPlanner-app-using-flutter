import 'package:flutter/material.dart';
import 'package:medication_remainder/controllers/bottomnavigationcontroller.dart';
import 'package:medication_remainder/controllers/task_controller.dart';
import 'package:medication_remainder/pharamacyMap/ui/map_screen.dart';
import 'package:medication_remainder/screens/homepage/addMedicine/add_med.dart';
import 'package:medication_remainder/screens/homepage/homepage.dart';
import 'package:medication_remainder/screens/settings.dart';
import 'package:medication_remainder/EmergencyContacts/emergencycontacts.dart';
import 'package:get/get.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({
    super.key,
  });

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int index = 0;

  final screens = [
    const Homepage(),
    const EmergencyContacts(),
    MapScreen(),
    const Settings()
  ];
  final _taskController = Get.put(TaskController());
  var notifyHelper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: TabBarMatrerialWidget(
        index: index,
        onChangedTab: onChangedTab,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.to(() => const AddMed());
          _taskController.getTasks();
          //TODO
        },
        backgroundColor: Colors.black87,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
