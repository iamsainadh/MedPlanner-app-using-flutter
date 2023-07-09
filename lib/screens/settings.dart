import 'package:flutter/material.dart';
import 'package:medication_remainder/models/doctornumber.dart';
import '/models/SettingTemplate.dart';
import '/models/profile.dart';
import 'package:get/get.dart';
import '/screens/pswd.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
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
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                //Setting Items
                SettingTemplate(
                  tapFun: () {
                    Get.to(
                      const Profile(),
                    );
                  },
                  img: "assets/icons/profile.png",
                  name: "Profile",
                  imgWidth: 60,
                  imgHeight: 60,
                ),
                const SizedBox(
                  height: 40,
                ),
                SettingTemplate(
                  tapFun: () {
                    Get.to(
                      const Password(),
                    );
                  },
                  img: "assets/icons/security.png",
                  name: "Change Details",
                  imgWidth: 60,
                  imgHeight: 60,
                ),
                const SizedBox(
                  height: 40,
                ),
                SettingTemplate(
                  tapFun: () {
                    Get.to(
                      const DoctorMobileNumber(),
                    );
                  },
                  img: "assets/icons/doctor.png",
                  name: "Doctor Number",
                  imgWidth: 60,
                  imgHeight: 60,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
