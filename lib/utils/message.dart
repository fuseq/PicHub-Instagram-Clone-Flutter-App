import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String name;
  final String imageUrl; // New property for the image URL

  Message({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
     
      children: [

       SizedBox(
          width: 100,
          height: 80,
         child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
                
              ],
            ),
       ),
        
        SizedBox(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Text(
                  
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
                RichText(
                  text: TextSpan(
                    
                    style: TextStyle(color: Colors.black),
                    children: [
                      
                      TextSpan(
                        text: 'Hello, how are you?',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Icon(Icons.camera_alt_outlined, color: Colors.black),
      ],
    );
  }
}
