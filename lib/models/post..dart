import 'package:pichub/models/user.dart';

class Post {
  String id;
  String postedBy;
  String imageUrl;
  String title;
  String location;
  String caption;
  String postedTimeago;
  String totalLikes;
  String totalComments;


  Post({
    required this.id,
    required this.postedBy,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.caption,
    required this.postedTimeago,
    required this.totalLikes,
    required this.totalComments,

  });
}