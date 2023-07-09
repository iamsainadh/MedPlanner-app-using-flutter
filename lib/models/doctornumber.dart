import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorMobileNumber extends StatefulWidget {
  const DoctorMobileNumber({super.key});

  @override
  State<DoctorMobileNumber> createState() => _DoctorMobileNumberState();
}

class _DoctorMobileNumberState extends State<DoctorMobileNumber> {
  String doctorNumber = '';
  final mobileController = TextEditingController();

  Future<void> saveDoctorNumber(doctorNumber) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('doctorNumber', doctorNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Doctor Number",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            TextField(
              controller: mobileController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                hintText: 'Enter Mobile Number',
                hintStyle: const TextStyle(color: Colors.white),
                iconColor: Colors.blue,
                icon: const Icon(Icons.phone),
                prefixText: "+91",
                prefixStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),

            // ElevatedButton(
            //     onPressed: () {
            //     },
            //     child: const Text("Save Number")),
            GestureDetector(
              onTap: () {
                saveDoctorNumber(mobileController.text);

                Get.back();
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
