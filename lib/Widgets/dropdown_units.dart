import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownUnitsOptions extends StatelessWidget {
  final List<Map<String, dynamic>> options;
  final String selectedValue;
  final ValueChanged onChanged;

  const DropdownUnitsOptions({
    Key? key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChanged,
      items:
      options.map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
        return DropdownMenuItem<String>(
          value: value['name'],
          child: Text(value['name']),
        );
      }).toList(),
    );
  }
}