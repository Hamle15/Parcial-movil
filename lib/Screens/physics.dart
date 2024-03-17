import 'package:flutter/material.dart';
import 'package:parcial/Widgets/app_large_text.dart';
import 'package:parcial/Widgets/text_field_custom.dart';
import 'package:parcial/Widgets/convert_button.dart';
import 'package:parcial/Widgets/dropdown_units.dart';
import 'package:parcial/data/unit_constants.dart';

class PhysicsScreen extends StatefulWidget {
  const PhysicsScreen({super.key});

  @override
  State<PhysicsScreen> createState() => _PhysicsState();
}

class _PhysicsState extends State<PhysicsScreen> {
  final TextEditingController _inputValue = TextEditingController();
  String _selectedFromUnit = units[0]['name'];
  String _selectedToUnit = units[1]['name'];

  void _convertPhysicsUnits() {
    if (_inputValue.text.isEmpty) {
      _showErrorDialog('Please enter a number to be converted');
      return;
    }

    double? unitValue = double.tryParse(_inputValue.text);
    if (unitValue == null) {
      _showErrorDialog('Please enter a valid value...');
      return;
    }

    double result = unitValue *
        (_getConversionFactor(_selectedFromUnit)) /
        (_getConversionFactor(_selectedToUnit));

    _showResultDialog(result);
  }

  double _getConversionFactor(String unitName) {
    //Search the selected unit and return its size
    return units
        .firstWhere((unit) => unit['name'] == unitName)['size']
        .toDouble();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showResultDialog(double result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content: Text('The result is: $result'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(top: 5, left: 7),
          child: Icon(
            Icons.menu,
            size: 30,
            color: Colors.black54,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            AppLargeText(text: "Physics units converter"),
            Container(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                "Convert any physics units you want",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFieldCustom(
                    controller: _inputValue,
                    keyboardType: TextInputType.number,
                    hintText: 'Type the number to be converted',
                    prefixIcon: const Icon(Icons.numbers, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 35.0),
                          child: Row(children: [
                            Container(
                              margin: EdgeInsets.only(right: 12.0),
                              child: Text(
                                'From:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ),
                            DropdownUnitsOptions(
                                options: units,
                                selectedValue: _selectedFromUnit,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedFromUnit = newValue;
                                  });
                                }),
                          ])),
                      Container(
                          child: Row(children: [
                        Container(
                          margin: EdgeInsets.only(right: 12.0),
                          child: Text(
                            'To:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                        DropdownUnitsOptions(
                            options: units,
                            selectedValue: _selectedToUnit,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedToUnit = newValue;
                              });
                            }),
                      ])),
                    ],
                  ),
                  Center(
                    child: ConvertButton(label: 'Convert', onPressed: _convertPhysicsUnits)
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
