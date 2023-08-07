import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/post..dart';

class ExploreTile extends StatelessWidget {
  const ExploreTile({super.key,required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Image.network(post.imageUrl),
          Container(
            padding: EdgeInsets.all(8),
            child: Icon(
              
            post.id=='0' || post.id=='10'
            ?Icons.collections_rounded
            :null,
            color: Colors.white,
            ),
          )

        ],
          
    ));
  }
}