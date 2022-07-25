import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final Map<String, String> formValues;
  final String formProperty;
  final bool obscureText;
  const CustomInputField({
    Key? key,
    this.helperText,
    this.hintText,
    this.labelText,
    this.icon,
    this.keyboardType,
    this.suffixIcon,
    required this.formValues,
    required this.formProperty,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'El campo no puede estar vacio';
        }
        return null;
      },
      onChanged: (value) => formValues[formProperty] = value,
      obscureText: obscureText,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        icon: icon == null ? null : Icon(icon),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
      ),
    );
  }
}
