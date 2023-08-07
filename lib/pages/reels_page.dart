import 'package:flutter/material.dart';
import 'package:pichub/data/mock.dart';
import 'package:pichub/widgets/reel_detail.dart';
import 'package:pichub/widgets/reel_side_action_bar.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Reels',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: Icon(Icons.photo_camera_outlined, color: Colors.white))
        ],
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                      image: NetworkImage(reels[index].imageUrl),
                      fit: BoxFit.cover)),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent
                        ],
                        begin: Alignment(0, -0.75),
                        end: Alignment(0, 0.1),
                      )), //LinearGradient // BoxDecoration
                    ), // Container
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent
                        ],
                        end: Alignment(0, -0.75),
                        begin: Alignment(0, 0.1),
                      )), // LinearGradient // BoxDecoration
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 14,
                              child: ReelDetail(reel: reels[index],),
                            ),
                            ReelSideActionBar(reel: reels[index],)
                          ],
                        )
                      ],
                    ) // Container
                  ],
                ), // Stack
              ));
        },
      ),
    );
  }
}
