import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medication_remainder/constant/notification_service.dart';
import 'package:medication_remainder/controllers/task_controller.dart';
import 'package:medication_remainder/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import '../../constant/task_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateTime _selectedDate = DateTime.now();
  String? userName;
  String? mobileNumber;
  late TwilioFlutter twilioFlutter;

  final _taskController = Get.put(TaskController());
  var notifyHelper;
  @override
  initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    getUserName();
    getMobileNumber();
    twilioFlutter = TwilioFlutter(
        accountSid: '<Place Your AccountSid>',
        authToken: '<Place Your AuthToken>',
        twilioNumber: 'number');
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '<User Number>', messageBody: 'Medicine Taken By $userName');
  }

  void getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    userName = prefs.getString('userName');
    setState(() {});
  }

  void getMobileNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    mobileNumber = prefs.getString('mobileNumber');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello $userName",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                //Task Section
                _addDateBar(),

                const SizedBox(
                  height: 12,
                ),
                //show Medicine Task
                SizedBox(
                  height: 800,
                  width: 500,
                  child: _showTasks(),
                )
                //
              ],
            ),
          ),
        ),
      ),

      //bottom navigation bar
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: (_, index) {
            Task task = _taskController.taskList[index];
            if (task.repeat == 'Daily') {
              DateTime date = DateFormat.jm().parse(task.startTime.toString());

              var myTime = DateFormat("HH:mm").format(date);
              NotifyHelper().scheduledNotification(
                int.parse(myTime.toString().split(":")[0]),
                int.parse(myTime.toString().split(":")[1]),
                task,
              );
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                      child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, task);
                          },
                          child: TaskTile(
                              controller: _taskController, ind: index)),
                    ],
                  )),
                ),
              );
            }

            if (task.date == DateFormat.yMd().format(_selectedDate)) {
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                      child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, task);
                          },
                          child: TaskTile(
                              controller: _taskController, ind: index)),
                    ],
                  )),
                ),
              );
            } else {
              return Container();
            }
          },
        );
      }),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4),
      height: task.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      child: Column(children: [
        Container(
          height: 6,
          width: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        ),
        task.isCompleted == 1
            ? Container()
            : _bottomSheetButton(
                label: "Taken",
                onTap: () {
                  _taskController.markTaskCompleted(task.id!);
                  sendSms();
                  Get.back();
                  //TODO
                },
                clr: Colors.green,
                context: context),
        const SizedBox(
          height: 20,
        ),
        _bottomSheetButton(
            label: "Delete Medicine",
            onTap: () {
              _taskController.delete(task);
              Get.back();
            },
            clr: Colors.red[300]!,
            context: context)
      ]),
    ));
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    required BuildContext context,
    bool isClose = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: isClose == true ? Colors.red : clr),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.red : clr,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _addDateBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat.yMMMMd().format(DateTime.now()),
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        Text(
          "Today",
          style: GoogleFonts.lato(
            textStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        //date timeline container
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: DatePicker(
            DateTime.now(),
            height: 100,
            width: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: const Color(0xFF4e5ae8),
            selectedTextColor: Colors.white,
            dateTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            )),
            dayTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            )),
            monthTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            )),
            onDateChange: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
        ),
      ],
    );
  }
}
