import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_package_test/models/districts.dart';
import 'package:flutter_package_test/models/provinces.dart';
import 'package:flutter_package_test/models/regencies.dart';
import 'package:http/http.dart' as http;

class DropDownSearchPage extends StatefulWidget {
  const DropDownSearchPage({Key? key}) : super(key: key);

  @override
  State<DropDownSearchPage> createState() => _DropDownSearchPageState();
}

class _DropDownSearchPageState extends State<DropDownSearchPage> {
  List<Provinces> allProvinces = [];

  List<Regencies> allRegencies = [];

  List<Districts> allDistricts = [];

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
            child: DropdownSearch<Provinces>(
              asyncItems: (text) async {
                var response = await http.get(
                  Uri.parse(
                      "http://www.emsifa.com/api-wilayah-indonesia/api/provinces.json"),
                );
                if (response.statusCode == 200) {
                  List data = json.decode(response.body) as List;
                  for (var element in data) {
                    allProvinces.add(Provinces.fromJson(element));
                  }
                  return allProvinces;
                } else {
                  return [];
                }
              },
              dropdownBuilder: (context, selectedItem) => Text(
                selectedItem?.name ?? "Pilih data",
              ),
              validator: (value) {
                if (value == null) {
                  return 'required filed';
                } else {
                  return value.name;
                }
              },
              onChanged: (value) {
                setState(() {
                  idProvince = value!.id;
                });
              },
              popupProps: PopupProps.menu(
                fit: FlexFit.tight,
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) {
                  return ListTile(
                    title: Text(item.name.toString()),
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
            child: DropdownSearch<Regencies>(
              asyncItems: (text) async {
                var response = await http.get(
                  Uri.parse(
                      "http://www.emsifa.com/api-wilayah-indonesia/api/regencies/$idProvince.json"),
                );
                if (response.statusCode == 200) {
                  List data = json.decode(response.body) as List;
                  for (var element in data) {
                    allRegencies.add(Regencies.fromJson(element));
                  }
                  return allRegencies;
                } else {
                  return [];
                }
              },
              dropdownBuilder: (context, selectedItem) => Text(
                selectedItem?.name ?? "Pilih data",
              ),
              validator: (value) {
                if (value == null) {
                  return 'required filed';
                } else {
                  return value.name;
                }
              },
              onChanged: (value) => setState(() {
                idRegency = value!.id;
              }),
              popupProps: PopupProps.menu(
                fit: FlexFit.tight,
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) {
                  return ListTile(
                    title: Text(item.name.toString()),
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
            child: DropdownSearch<Districts>(
              asyncItems: (text) async {
                var response = await http.get(
                  Uri.parse(
                      "http://www.emsifa.com/api-wilayah-indonesia/api/districts/$idRegency.json"),
                );
                if (response.statusCode == 200) {
                  List data = json.decode(response.body) as List;
                  for (var element in data) {
                    allDistricts.add(Districts.fromJson(element));
                  }
                  return allDistricts;
                } else {
                  return [];
                }
              },
              dropdownBuilder: (context, selectedItem) => Text(
                selectedItem?.name ?? "Pilih data",
              ),
              validator: (value) {
                if (value == null) {
                  return 'required filed';
                } else {
                  return value.name;
                }
              },
              onChanged: (value) => print(value),
              popupProps: PopupProps.menu(
                fit: FlexFit.tight,
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) {
                  return ListTile(
                    title: Text(item.name.toString()),
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
