

import 'package:pichub/models/user.dart';

import '../models/post..dart';
import '../models/reel.dart';

User demoUser1 = User(id: 'id1', username: 'user_1', url: 'https://images.unsplash.com/photo-1617854818583-09e7f077a156?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
User demoUser2 = User(id: 'id2', username: 'user_2', url: 'https://images.unsplash.com/photo-1617854818583-09e7f077a156?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
User demoUser3 = User(id: 'id3', username: 'user_3', url: 'https://images.unsplash.com/photo-1617854818583-09e7f077a156?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
User demoUser4 = User(id: 'id4', username: 'user_4', url: 'https://images.unsplash.com/photo-1617854818583-09e7f077a156?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
User demoUser5 = User(id: 'id5', username: 'user_5', url: 'https://images.unsplash.com/photo-1617854818583-09e7f077a156?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');




final List<Reel> reels = 
[
 Reel(postedBy: demoUser1, imageUrl: 'https://images.unsplash.com/photo-1617854818583-09e7f077a156?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', audioTitle: 'audioTitle', caption: 'caption', totalLikes: '1.2M', totalComments: '3,212', isLiked: true, isTagged: true, taggedUser: demoUser5),
 Reel(postedBy: demoUser2, imageUrl: 'https://images.unsplash.com/photo-1591154669695-5f2a8d20c089?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80', audioTitle: 'audioTitle', caption: 'caption', totalLikes: '1.2M', totalComments: '3,212', isLiked: false, isTagged: true, taggedUser: demoUser4),
 Reel(postedBy: demoUser3, imageUrl: 'https://images.unsplash.com/photo-1605496036006-fa36378ca4ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80', audioTitle: 'audioTitle', caption: 'caption', totalLikes: '1.2M', totalComments: '3,212', isLiked: true, isTagged: true, taggedUser: demoUser3),
 Reel(postedBy: demoUser4, imageUrl: 'https://images.unsplash.com/photo-1559981421-3e0c0d712e3b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=716&q=80', audioTitle: 'audioTitle', caption: 'caption', totalLikes: '1.2M', totalComments: '3,212', isLiked: false, isTagged: true, taggedUser: demoUser2),
 Reel(postedBy: demoUser5, imageUrl: 'https://images.unsplash.com/photo-1580477667995-2b94f01c9516?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', audioTitle: 'audioTitle', caption: 'caption', totalLikes: '1.2M', totalComments: '3,212', isLiked: true, isTagged: true, taggedUser: demoUser1), 
];