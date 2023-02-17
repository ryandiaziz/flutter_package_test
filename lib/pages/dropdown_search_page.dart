import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DropDownSearchPage extends StatelessWidget {
  List<Map<String, dynamic>> data = [
    {
      "country": "Brazil",
      "id": 1,
    },
    {
      "country": "Italy",
      "id": 2,
    },
    {
      "country": "Indonesia",
      "id": 3,
    },
    {
      "country": "Canada",
      "id": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DropdownSearch<Map<String, dynamic>>(
          validator: (value) {
            if (value == null) {
              return 'required filed';
            } else {
              return value['country'];
            }
          },
          onChanged: (value) => print(value),
          popupProps: const PopupProps.menu(
            fit: FlexFit.tight,
            showSearchBox: true,
          ),
          showClearButton: true,
          selectedItem: data[0],
          items: data,
        ),
      ),
    );
  }
}
