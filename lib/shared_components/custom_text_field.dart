import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final IconData icon;

  const CustomTextField({
    super.key, 
    required this.hint, 
    required this.icon,
    required this.onSaved,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      validator:(val){
        if(val == null || val.isEmpty){
          return "please fill this field";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        icon: Icon(icon)
      ),
      onSaved: onSaved,
    );
  }
}
