import 'package:flutter/material.dart';
import 'package:flutter_package_test/pages/faker_page.dart';
import 'package:flutter_package_test/pages/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Navigation(),
    );
  }
}
