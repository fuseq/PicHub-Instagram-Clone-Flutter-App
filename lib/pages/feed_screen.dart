import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pichub/data/mock.dart';

import 'package:pichub/pages/message_page.dart';
import '../models/post..dart';
import '../utils/bubble_stories.dart';
import '../utils/user_posts.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    fetchPostsFromFirestore();
  }

  Future<void> fetchPostsFromFirestore() async {
    final firestore = FirebaseFirestore.instance;
    final collectionId =
        'posts'; // Replace this with your Firestore collection ID (e.g., 'posts')

    try {
      final querySnapshot = await firestore.collection(collectionId).get();

      List<Post> fetchedPosts = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        print(data.length.toString());
        print(data['imageUrl'].toString());
        return Post(
          id: data['id'] ?? '',
          postedBy: data['postedBy'] ??
              '', // Replace this with the User object (if available) for the 'postedBy' field
          imageUrl:
              data['imageUrl'] ?? '', // Fetch 'imageUrl' field from Firestore
          title: data['title'] ?? '', // Fetch 'title' field from Firestore
          location:
              data['location'] ?? '', // Fetch 'location' field from Firestore
          caption:
              data['caption'] ?? '', // Fetch 'caption' field from Firestore
          postedTimeago: data['postedTimeago'] ??
              '', // Fetch 'postedTimeago' field from Firestore
          totalLikes: data['totalLikes'] ??
              '', // Fetch 'totalLikes' field from Firestore
          totalComments: data['totalComments'] ??
              '', // Fetch 'totalComments' field from Firestore
        );
      }).toList();
      
      setState(() {
        posts = fetchedPosts;
      });
    } catch (error) {
      print('Failed to fetch posts from Firestore: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Image.asset('assets/pichub.png', width: 100),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MessagePage()),
                    (route) => false,
                  );
                },
                icon:
                    Icon(Icons.messenger_outline_outlined, color: Colors.black),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return BubbleStories(text: posts[index].postedBy);
                },
              ),
            ),
          ),
          
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return UserPosts(
                  name: posts[index].postedBy,
                  imageUrl: posts[index].imageUrl, // Use the 'imageUrl' property from the Post object
                  totalLikes: posts[index].totalLikes, // Use the 'caption' property from the Post object
                );
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
