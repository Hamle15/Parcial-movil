import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? obscureCharacter;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly; // Hacer el TextField no editable



  const TextFieldCustom({Key? key,
    required this.controller,
    required this.keyboardType,
    this.obscureText = false,
    this.obscureCharacter = '*',
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      obscuringCharacter: obscureCharacter!,
      readOnly: readOnly,
      style: const TextStyle(
        color: Colors.black45,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 12.0),
        constraints: BoxConstraints(
          maxHeight: height * 0.065,
          maxWidth: width,
        ) ,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 14,
        ) ,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder (
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          )
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          )
        )


      ),

    ) ;
  }
}
