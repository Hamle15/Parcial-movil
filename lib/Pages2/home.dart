import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcial/Widgets/app_large_text.dart';
import 'package:parcial/Widgets/text_field_custom.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _celsiusController = TextEditingController();
  final TextEditingController _fahrenheitController = TextEditingController();


  void _convertCelsiusToFahrenheit() {
    if (_celsiusController.text.isEmpty) {
      _showErrorDialog('Por favor ingresa un valor para Celsius.');
      return;
    }

    double? celsius = double.tryParse(_celsiusController.text);
    if (celsius == null) {
      _showErrorDialog('Por favor ingresa un valor numérico válido para Celsius.');
      return;
    }

    double fahrenheit = (celsius * 9 / 5) + 32;
    _fahrenheitController.text = fahrenheit.toStringAsFixed(2);

    _showResultDialog(fahrenheit);
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
              child: const Text('Cerrar'),
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
          title: const Text('Resultant'),
          content: Text('El resultant es: $result'),
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
            AppLargeText(text: "Converter"),
            Container(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                  "Convert your temperature to Celsius",
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
                crossAxisAlignment: CrossAxisAlignment.stretch, // Asegura que los elementos se expandan horizontalmente
                children: [
                  TextFieldCustom(
                    controller: _celsiusController,
                    keyboardType: TextInputType.number,
                    hintText: 'Celsius',
                    prefixIcon: const Icon(Icons.email, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  TextFieldCustom(
                    controller: _fahrenheitController,
                    keyboardType: TextInputType.number,
                    hintText: 'Fahrenheit',
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                    readOnly: true,
                  ),
                  SizedBox(height: 20),
                  Center( // Puedes usar Row si prefieres
                    child: ElevatedButton(
                      onPressed: _convertCelsiusToFahrenheit,
                      child: Text('Convertir'),
                      style: ButtonStyle(
                        // Aumenta el ancho mínimo del botón
                        minimumSize: MaterialStateProperty.all(Size(150, 40)),
                      ),
                    ),
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
