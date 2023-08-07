import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class UserPosts extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String totalLikes;

  UserPosts({required this.name, required this.imageUrl, required this.totalLikes});

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    try {
      imageBytes = base64Decode(imageUrl);
    } catch (e) {
      imageBytes = null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        imageBytes != null
            ? Image.memory(
                imageBytes,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : SizedBox(height: 300, width: double.infinity, child: Center(child: Text('Image Error'))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 10),
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(width: 10),
                  Icon(Icons.send),
                ],
              ),
              Icon(Icons.bookmark_border),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Liked by $totalLikes people ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '  This is a caption'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
