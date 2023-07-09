// ignore_for_file: file_names
import 'package:flutter/material.dart';


class SettingTemplate extends StatelessWidget {
  
  final VoidCallback tapFun;
  final String img;
  final String name;
  final double imgWidth;
  final double imgHeight;
  const SettingTemplate({
    super.key,
    required this.img,
    required this.name,
    required this.imgWidth,
    required this.imgHeight, required this.tapFun,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFun,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
        
          width: 312,
          height: 88,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.amberAccent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              
              children: [
                Image.asset(img, width: imgWidth, height: imgHeight),
                Text(name,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
