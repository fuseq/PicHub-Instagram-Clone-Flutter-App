import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/reel.dart';

class ReelSideActionBar extends StatelessWidget {
  const ReelSideActionBar({super.key, required this.reel});
  final double _iconSize = 28;
  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
            onPressed: () => {},
            icon: Icon(reel.isLiked ? Icons.favorite : Icons.favorite_outline),
            iconSize: _iconSize,
            color: reel.isLiked ? Colors.red : Colors.white,
          ),
          Text(
            reel.totalLikes,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.chat_bubble_outline),
            iconSize: _iconSize,
            color: Colors.white,
          ),
          Text(
            reel.totalComments,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.send_outlined),
            iconSize: _iconSize,
            color: Colors.white,
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.more_horiz),
            iconSize: _iconSize,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage('assets/user2.png'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 10),
        ]));
  }
}
