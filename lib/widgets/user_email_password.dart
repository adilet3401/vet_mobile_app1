import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';

class UserEmailPasswordline extends StatelessWidget {
  const UserEmailPasswordline({
    super.key,
    required this.icon,
    required this.hinText,
    this.controller,
    this.errorText,
    this.onChanged,
    this.obsureText = false,
    this.inputFormatters,
  });

  final String hinText, icon;
  final TextEditingController? controller;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool obsureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, //controller
      // keyboardType: TextInputType.number,asasa
      inputFormatters: inputFormatters, // это для ограничения ввода текста
      onChanged: onChanged, // это для изменения поля ввода после ввода текста
      obscureText: obsureText, // это для скрытия текста в поле ввода
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset(icon),
        ),
        // labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIconColor: Colors.grey,
        prefixIconConstraints: BoxConstraints(minWidth: 25, minHeight: 25),
        hintText: hinText,
        hintStyle: TextStyles.buttonTextStyle.copyWith(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff99dbbf), width: 2),
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
