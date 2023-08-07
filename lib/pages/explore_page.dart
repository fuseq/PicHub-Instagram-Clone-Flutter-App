import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pichub/models/post..dart';
import 'package:pichub/models/user.dart';
import 'package:pichub/widgets/explore_tile.dart';

import '../data/mock.dart';
import '../widgets/custom_explore_app_bar.dart';
import '../widgets/persistent_header.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: CustomScrollView(slivers: [
         
          SliverPersistentHeader(
              pinned: true, delegate: PersistentHeader(child: Text(''))),
               CustomExploreAppbar(),
          SliverStaggeredGrid.countBuilder(
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              crossAxisCount: 3,
              staggeredTileBuilder: (int index) {
                int modedindex = index % 20;
                int cXCellCount = modedindex == 11 ? 2 : 1;
                double mXCellCount = 1;
                if (modedindex == 2 || modedindex == 11) {
                  mXCellCount = 2;
                }

                return StaggeredTile.count(cXCellCount, mXCellCount);
              },
              itemBuilder: (BuildContext context, int index) {
                return ExploreTile(
                  post: Post(
                      id: '$index',
                      postedBy: demoUser1.username,
                      imageUrl: 'https://picsum.photos/id/${1047+index}/400/${index%20 == 2 ? 805 : 400}',
                      title: 'title',
                      location: 'location',
                      caption: 'caption',
                      postedTimeago: 'postedTimeago',
                      totalLikes: 'totalLikes',
                      totalComments: 'totalComments',
),
                );
              },
              itemCount: 20),
        ])));
  }
}
