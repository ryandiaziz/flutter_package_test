import 'dart:math';

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

class FakerPage extends StatelessWidget {
  FakerPage({Key? key}) : super(key: key);
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FAKER",
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            height: 50,
            width: 200,
            child: Center(
              // Format waktu menggunakan package intl
              child: Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(
                    "https://picsum.photos/id/${151 + index}/200/300",
                  ),
                ),
                // Data dengan faker
                title: Text(faker.person.name()),
                subtitle: Text(
                  faker.internet.email(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
