import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medication_remainder/models/change_user_name.dart';
import 'package:medication_remainder/models/changemobilenumber.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  Future<void> saveMobileNumber(mobileNumber) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('mobileNumber', mobileNumber);
  }

  Future<void> saveUserName(userName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            //Top Bar
            Row(
              children: [
                const Material(),
                const Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(
                  width: 25,
                ),
                Image.asset(
                  "assets/icons/setting.jpg",
                  width: 32,
                  height: 32,
                ),
              ],
            ),
            //End of Top Bar
          ],
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                height: 700,
                width: 350,
                decoration: const BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/icons/security.png")),
                          ),
                        ),
                        const Text(
                          "Change \nDetails",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(const ChangeUserName());
                              },
                              child: const Text(
                                "Change User Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.blue,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(const ChangeMobileNumber());
                              },
                              child: const Text(
                                "Change Mobile Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    ))));
  }
}
