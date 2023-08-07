import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:marquee/marquee.dart';

import '../models/reel.dart';

class ReelDetail extends StatelessWidget {
  const ReelDetail({super.key, required this.reel});
  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            horizontalTitleGap: 12,
            title: Text(
              '${reel.postedBy.username}- Follow',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            leading: CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ExpandableText(
              reel.caption,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              expandText: 'more',
              collapseText: 'less',
              expandOnTextTap: true,
              collapseOnTextTap: true,
              maxLines: 1,
              linkColor: Colors.grey,
            ),
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            horizontalTitleGap: 5,
            title: reel.isTagged
                ? Row(
                    children: [
                      Container(
                        height: 20,
                        width: 125,
                        child: Marquee(
                          velocity: 10,
                          text: "${reel.audioTitle} ",
                          scrollAxis: Axis.horizontal,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Icon(Icons.person_outline_outlined,color: Colors.white,size: 16,),
                      ),
                      Expanded(
                        child: Text(
                          '${reel.taggedUser.username} others',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                : Text(
                    reel.audioTitle,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
            leading: Icon(
              Icons.graphic_eq_outlined,
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
