import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({Key? key}) : super(key: key);

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  String? selectedValue;
  List<String> data = [
    'M Bimo Bayu Bagaskara',
    'Ganteng',
    'Banget',
    'Cuy',
    'Rill',
    'Ga boong',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: DropdownButtonHideUnderline(
              child: PopupMenuButton<String>(
                child: ListTile(
                  title: Text(selectedValue ?? "Select an item"),
                  trailing: const Icon(Icons.arrow_drop_down),
                ),
                itemBuilder: (BuildContext context) {
                  return data.map((String value) {
                    return PopupMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList();
                },
                onSelected: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                  print(value);
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: data,
              onChanged: print,
              selectedItem: "Halo bang",
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  labelText: "Select an item",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
