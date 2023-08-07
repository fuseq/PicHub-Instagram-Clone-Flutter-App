import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomExploreAppbar extends StatelessWidget {
  const CustomExploreAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      centerTitle: false,
      elevation: 0,
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          cursorColor: Colors.grey.shade500,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 16.5,fontWeight: FontWeight.w500),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey.shade500)),
            style: TextStyle(color: Colors.black,fontSize: 16.5), 
    )));
  }
}