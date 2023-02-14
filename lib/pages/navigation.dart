import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_package_test/pages/faker_page.dart';
import 'package:flutter_package_test/pages/profile_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<Widget> widgets = [
    const FakerPage(),
    const Center(
      child: Text(
        "Discovery",
      ),
    ),
    const Center(
      child: Text(
        "Add",
      ),
    ),
    const Center(
      child: Text(
        "Message",
      ),
    ),
    const ProfilePage()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[index],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
