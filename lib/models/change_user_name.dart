import 'package:flutter/material.dart';
import 'package:medication_remainder/screens/bottomnavigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeUserName extends StatefulWidget {
  const ChangeUserName({super.key});

  @override
  State<ChangeUserName> createState() => _ChangeUserNameState();
}

class _ChangeUserNameState extends State<ChangeUserName> {
  final userNameController = TextEditingController();

  Future<void> saveUserName(userName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userName);
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
              "Enter Your Name",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                labelText: 'User Name',
                hintText: 'Enter Your Name',
                hintStyle: const TextStyle(color: Colors.white),
                iconColor: Colors.blue,
                icon: const Icon(Icons.person),
                prefixStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(),
                ),
              ),
              maxLength: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ElevatedButton(
                //     onPressed: () {
                //     },
                //     child: const Text("Save Number")),
                GestureDetector(
                  onTap: () {
                    saveUserName(userNameController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavi()),
                    );
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
          ],
        ),
      ),
    );
  }
}
