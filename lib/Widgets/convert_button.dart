import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ConvertButton({
    Key? key,
    required this.label,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(150, 40)),
      ),
    );
  }
}