import 'package:pichub/models/user.dart';

class Reel {
  final User postedBy;
  final String imageUrl;
  final String audioTitle;
  final String caption;
  final String totalLikes;
  final String totalComments;
  final bool isLiked;
  final bool isTagged;
  final User taggedUser;

  Reel({
    required this.postedBy,
    required this.imageUrl,
    required this.audioTitle,
    required this.caption,
    required this.totalLikes,
    required this.totalComments,
    required this.isLiked,
    required this.isTagged,
    required this.taggedUser,
  });

}