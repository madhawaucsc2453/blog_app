import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  
  const AuthField({
    required this.hint,
    required this.controller,
    this.obscureText=false,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: controller,
       obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint
        ),
        validator: (value) {
          if(value!.isEmpty){
            return"$hint is required"; 
          }
          return null;
        },
    );
  }
}