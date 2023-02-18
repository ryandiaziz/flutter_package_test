import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_package_test/models/province_models.dart';
import 'package:http/http.dart' as http;

class DropDownSearchPage extends StatefulWidget {
  const DropDownSearchPage({Key? key}) : super(key: key);

  @override
  State<DropDownSearchPage> createState() => _DropDownSearchPageState();
}

class _DropDownSearchPageState extends State<DropDownSearchPage> {
  List<Map<String, dynamic>> allProvinces = [];

  List<Map<String, dynamic>> allRegencies = [];

  List<Map<String, dynamic>> allDistricts = [];

  String? idProvince;

  String? idRegency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Dropdown Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DropdownSearch<Map<String, dynamic>>(
              asyncItems: (text) async {
                var response = await http.get(
                  Uri.parse(
                      "http://www.emsifa.com/api-wilayah-indonesia/api/provinces.json"),
                );
                if (response.statusCode == 200) {
                  List data = json.decode(response.body) as List;
                  data.forEach((element) {
                    allProvinces.add(element);
                  });
                  return allProvinces;
                } else {
                  return [];
                }
              },
              dropdownBuilder: (context, selectedItem) => Text(
                selectedItem?["name"] ?? "Pilih data",
              ),
              validator: (value) {
                if (value == null) {
                  return 'required filed';
                } else {
                  return value['name'];
                }
              },
              onChanged: (value) {
                setState(() {
                  idProvince = value!["id"];
                });
                print(value!["id"]);
              },
              popupProps: PopupProps.menu(
                fit: FlexFit.tight,
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) {
                  return ListTile(
                    title: Text(item['name'].toString()),
                  );
                },
              ),
              showClearButton: true,
              // selectedItem: allProvince[],
              items: allProvinces,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: DropdownSearch<Map<String, dynamic>>(
              asyncItems: (text) async {
                var response = await http.get(
                  Uri.parse(
                      "http://www.emsifa.com/api-wilayah-indonesia/api/regencies/$idProvince.json"),
                );
                if (response.statusCode == 200) {
                  List data = json.decode(response.body) as List;
                  data.forEach((element) {
                    allRegencies.add(element);
                  });
                  return allRegencies;
                } else {
                  return [];
                }
              },
              dropdownBuilder: (context, selectedItem) => Text(
                selectedItem?["name"] ?? "Pilih data",
              ),
              validator: (value) {
                if (value == null) {
                  return 'required filed';
                } else {
                  return value['name'];
                }
              },
              onChanged: (value) => setState(() {
                idRegency = value!['id'];
              }),
              popupProps: PopupProps.menu(
                fit: FlexFit.tight,
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) {
                  return ListTile(
                    title: Text(item['name'].toString()),
                  );
                },
              ),
              showClearButton: true,
              // selectedItem: allProvince[],
              items: allRegencies,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: DropdownSearch<Map<String, dynamic>>(
              asyncItems: (text) async {
                var response = await http.get(
                  Uri.parse(
                      "http://www.emsifa.com/api-wilayah-indonesia/api/districts/$idRegency.json"),
                );
                if (response.statusCode == 200) {
                  List data = json.decode(response.body) as List;
                  data.forEach((element) {
                    allDistricts.add(element);
                  });
                  return allDistricts;
                } else {
                  return [];
                }
              },
              dropdownBuilder: (context, selectedItem) => Text(
                selectedItem?["name"] ?? "Pilih data",
              ),
              validator: (value) {
                if (value == null) {
                  return 'required filed';
                } else {
                  return value['name'];
                }
              },
              onChanged: (value) => print(value),
              popupProps: PopupProps.menu(
                fit: FlexFit.tight,
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) {
                  return ListTile(
                    title: Text(item['name'].toString()),
                  );
                },
              ),
              showClearButton: true,
              // selectedItem: allProvince[],
              items: allDistricts,
            ),
          ),
          //Check Data form API
          ElevatedButton(
            onPressed: () async {
              var response = await http.get(
                Uri.parse(
                    "http://www.emsifa.com/api-wilayah-indonesia/api/provinces.json"),
              );
              // print(response.body);
              List data = json.decode(response.body) as List;

              print(data[1]["name"]);
            },
            child: const Text("Get Data"),
          )
        ],
      ),
    );
  }
}
