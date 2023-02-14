import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AvatarGlow(
          endRadius: 100.0,
          glowColor: Colors.green,
          child: Material(
            // Replace this child with your own
            elevation: 8.0,
            shape: const CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              backgroundImage: const NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F2.bp.blogspot.com%2F-qPEuXMyaGxk%2FVdLSmz9xNTI%2FAAAAAAAAClQ%2FMkAwGSyzCBo%2Fs1600%2F6.jpg&f=1&nofb=1&ipt=317f094bcd6363c4003a1a15f748ac5fa93ea99e93d91348428385d75c5d5396&ipo=images"),
              radius: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
