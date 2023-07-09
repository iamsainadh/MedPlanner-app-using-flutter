import 'package:flutter/material.dart';


class NotificationPanel extends StatelessWidget {
  const NotificationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: 
      [
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
                  "assets/setting.jpg",
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
              const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  height: 700,
                  width: 350,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: 
                            const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/accessibility.png")),
                            ),
                          ),
                          const Text(
                            "Accessibility",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const 
                        [
                          Align(alignment: Alignment.topLeft,
                          child : Text(
                          "Talkback",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              ),
                        ),
                        ),
                        
                        SizedBox(height: 10,),
                        Text(
                          "Magnification",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(height: 10,),

                        
                        

                        
                        ],
                      ),
                    ],
                  ),
                ),
              
            ],
          ),
        ),
      ]
      ),
    );
  }
}