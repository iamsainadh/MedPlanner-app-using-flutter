import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ContactsTemplate extends StatelessWidget {
  final name;
  final number;

  const ContactsTemplate({
    super.key,
    required this.name,
    required this.number,
  });

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
              AppBar(
                title: const Text("Emergency Contacts"),
                backgroundColor: Colors.deepOrangeAccent,
              ),
              const SizedBox(
                height: 30,
              ),
              ListTile(
                title: Text(
                  name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: Text(
                  number,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                trailing: IconButton(
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(number);
                  },
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

// GestureDetector(
      
//       child: Padding(
//         padding: const EdgeInsets.all(20),
        
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Row(
              
//               children: [
//                 Text(widget.name),
//                 Text(widget.number),
//                 ElevatedButton(  
                    
//                   child: const Text('Call'),  
//                   onPressed: ()async{
//                     await FlutterPhoneDirectCaller.callNumber(widget.number);
//                   }, 
                 
//                 ), 
                
//                  ],
//             ),
//           ),
//         ),
//       );