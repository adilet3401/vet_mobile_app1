import 'package:flutter/material.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';

class LineTheBilTash extends StatelessWidget {
  final String hintext, icon;

  const LineTheBilTash({super.key, required this.hintext, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller, //controller
      // keyboardType: TextInputType.number,asasa
      // inputFormatters: inputFormatters, // это для ограничения ввода текста
      // onChanged: onChanged, // это для изменения поля ввода после ввода текста
      // obscureText: obsureText, // это для скрытия текста в поле ввода
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(15),
          child: Image.asset(icon, scale: 25),
        ),
        // labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIconColor: Colors.grey,
        prefixIconConstraints: BoxConstraints(minWidth: 25, minHeight: 25),
        hintText: hintext,
        hintStyle: TextStyles.buttonTextStyle.copyWith(color: Colors.grey),
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
        // errorText: errorText,
      ),
    );
  }
}
