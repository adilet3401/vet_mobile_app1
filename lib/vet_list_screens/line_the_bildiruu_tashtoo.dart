import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LineTheBilTash extends StatelessWidget {
  final TextEditingController? controller;
  final String hintext;
  final String icon;
  final String? errorText;
  final void Function(String)? onChanged;

  const LineTheBilTash({
    super.key,
    this.controller,
    required this.hintext,
    required this.icon,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(icon, scale: 30),
        ),
        hintText: hintext,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff99dbbf), width: 1),
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff01A560), width: 2),
          borderRadius: BorderRadius.circular(24),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        errorText: errorText,
      ),
    );
  }
}
