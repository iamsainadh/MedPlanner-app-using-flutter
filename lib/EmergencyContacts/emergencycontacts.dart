import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmergencyContacts extends StatefulWidget {
  const EmergencyContacts({Key? key}) : super(key: key);

  @override
  State<EmergencyContacts> createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {
  String? mobileNumber;
  String doctorNumber = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMobileNumber();
    getDoctorNumber();
  }

  void getDoctorNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    doctorNumber = prefs.getString('doctorNumber')!;
    setState(() {});
  }

  void getMobileNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    mobileNumber = prefs.getString('mobileNumber');
    setState(() {});
  }

  final ambulanceNumber = '108';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Emergency Contacts",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              ListTile(
                title: const Text("Caretaker Number"),
                subtitle: Text(mobileNumber!),
                trailing: TextButton(
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(mobileNumber!);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue),
                    ),
                  ),
                  child: const Text("Call"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text("Ambulance"),
                subtitle: Text(ambulanceNumber),
                trailing: TextButton(
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(mobileNumber!);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue),
                    ),
                  ),
                  child: const Text("Call"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text("Doctor"),
                subtitle: doctorNumber.isEmpty
                    ? const Text("Enter Doctor Number Settings Tab")
                    : Text(doctorNumber),
                trailing: TextButton(
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(mobileNumber!);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue),
                    ),
                  ),
                  child: const Text("Call"),
                ),
              ),
            ],
          ),
        ),
      );
}
