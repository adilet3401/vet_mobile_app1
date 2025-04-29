import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/text_styles.dart';

class EmailPhoneNameEditLine extends StatelessWidget {
  const EmailPhoneNameEditLine({
    super.key,
    required this.hinText,
    this.inputFormatters,
    required TextEditingController controller,
  });

  final String hinText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters, // это для ограничения ввода текста
      decoration: InputDecoration(
        // prefixIcon: Padding(
        //   padding: EdgeInsets.all(15),
        //   child: SvgPicture.asset(icon),
        // ),
        // labelText: 'Телефон',
        labelStyle: TextStyle(color: Colors.grey),
        prefixIconColor: Colors.grey,
        prefixIconConstraints: BoxConstraints(minWidth: 25, minHeight: 25),
        hintText: hinText,
        hintStyle: TextStyles.buttonTextStyle.copyWith(color: Colors.black),
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
      ),
    );
  }
}
