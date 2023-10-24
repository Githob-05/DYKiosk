import 'package:flutter/material.dart';

class MainSliverAppBer extends StatelessWidget {
  const MainSliverAppBer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shadowColor: Colors.white.withOpacity(0),
      backgroundColor: Colors.black,
      expandedHeight: 120,
      pinned: true,
      flexibleSpace: Image.network(
        "https://blog.kakaocdn.net/dn/pW6x2/btrV0Q1FR5w/yugBLAZhQxVGlWTpWMQLVk/img.jpg",
        fit: BoxFit.cover,
      ),
      title: const Text("Book coffee", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      centerTitle: true,
    );
  }
}
