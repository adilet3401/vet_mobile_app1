import 'package:flutter/material.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.borderRadius,
    required this.minimumSize,
    this.isLoading =
        false, // Добавляем переменную isLoading с дефолтным значением false
  });

  final String text;
  final void Function()? onPressed;
  final BorderRadius borderRadius;
  final Size minimumSize;
  final bool isLoading; // Новая переменная для отображения индикатора загрузки

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          isLoading ? null : onPressed, // Блокируем кнопку, если идет загрузка
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        backgroundColor: const Color(0xff01A560),
      ),
      child:
          isLoading
              ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
              : Text(text, style: TextStyles.buttonTextStyle),
    );
  }
}
