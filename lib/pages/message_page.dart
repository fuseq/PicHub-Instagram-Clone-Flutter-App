import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pichub/main.dart';
import 'package:pichub/pages/feed_screen.dart';
import 'package:pichub/utils/message.dart';
import 'dart:convert';
import '../utils/bubble_stories.dart';
import '../utils/user_posts.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  final List people = [
    'Your story',
    'egefitness',
    'chloegmoretz',
    'marsthales',
    'kaitegonewild'
  ];
  final List posts = [
    'chloegmoretz',
    'egefitness',
    'marsthales',
    'kaitegonewild',
    'marsthales'
  ];

  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchImageUrls();
  }

  Future<void> fetchImageUrls() async {
    final String unsplashApiKey = 'ZWPiq_QxTy6MEHtUW5GkGkbN6apaBBbFcVGlhw1Irf0';
    final int count = 5; // Fetch 5 random images

    final response = await http.get(
      Uri.parse('https://api.unsplash.com/photos/random?count=$count'),
      headers: {'Authorization': 'Client-ID $unsplashApiKey'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<String> urls = data
          .map<String>((item) => item['urls']['regular'])
          .toList(); // Cast to List<String>
      setState(() {
        imageUrls = urls;
      });
    } else {
      print('Failed to fetch image URLs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
              (route) => false,
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/pichub.png', width: 100),
            Row(
              children: [
                Icon(
                  Icons.video_call_outlined,
                  color: Colors.black,
                ),
                SizedBox(width: 12),
                Icon(Icons.favorite_outline_outlined, color: Colors.black),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true, //<-- SEE HERE
                fillColor: Colors.grey.shade200,
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.black),
                
                
                
              ),
            ),
          ),
          Container(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: people.length,
              itemBuilder: (context, index) {
                return BubbleStories(text: people[index]);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Message(
                  name: posts[index],
                  imageUrl: imageUrls.isNotEmpty
                      ? imageUrls[index % imageUrls.length]
                      : 'https://picsum.photos/400/300',
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
