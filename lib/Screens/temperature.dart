import 'package:flutter/material.dart';
import 'package:parcial/Widgets/app_large_text.dart';
import 'package:parcial/Widgets/convert_button.dart';
import 'package:parcial/Widgets/text_field_custom.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final TextEditingController _celsiusController = TextEditingController();
  final TextEditingController _fahrenheitController = TextEditingController();

  void _calculate() {
    double? celsius = double.tryParse(_celsiusController.text);
    double? fahrenheit = double.tryParse(_fahrenheitController.text);

    if (celsius != null) {
      double converted = (celsius * 9 / 5) + 32;
      _fahrenheitController.text = converted.toStringAsFixed(2);
      _showResultDialog(converted, 'Fahrenheit');
    } else if (fahrenheit != null) {
      double converted = (fahrenheit - 32) * 5 / 9;
      _celsiusController.text = converted.toStringAsFixed(2);
      _showResultDialog(converted, 'Celsius');
    } else {
      _showErrorDialog('Please enter a valid value in Celsius or Fahrenheit.');
    }
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

  void _showResultDialog(double result, String unit) {
    String unitText;
    if (unit == 'Celsius') {
      unitText = 'Celsius';
    } else {
      unitText = 'Fahrenheit';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black87),
              children: [
                const TextSpan(text: 'The conversion result is: '),
                TextSpan(
                  text: '$result $unitText',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
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
    ).then((_) {
      _celsiusController.clear();
      _fahrenheitController.clear();

      // Remueve el foco del TextField
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            AppLargeText(text: "Converter"),
            Container(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                "Convert your temperature to Celsius or Fahrenheit",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFieldCustom(
                    controller: _celsiusController,
                    keyboardType: TextInputType.number,
                    hintText: 'Celsius',
                    prefixIcon: const Icon(Icons.numbers, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  TextFieldCustom(
                    controller: _fahrenheitController,
                    keyboardType: TextInputType.number,
                    hintText: 'Fahrenheit',
                    prefixIcon: Icon(Icons.numbers, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ConvertButton(label: 'Calculate', onPressed: _calculate),
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
