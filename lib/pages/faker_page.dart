import 'dart:math';

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class FakerPage extends StatelessWidget {
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FAKER",
        ),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage: NetworkImage(
              "https://picsum.photos/id/${151 + index}/200/300",
            ),
          ),
          title: Text(faker.person.name()),
          subtitle: Text(faker.internet.email()),
        ),
      ),
    );
  }
}
