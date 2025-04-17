import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';

class NavigationContainer extends StatelessWidget {
  const NavigationContainer({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        width: 135,
        height: 135,
        decoration: BoxDecoration(
          color: Color(0xff01A560),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Изображение
            SvgPicture.asset(image, width: 50, height: 50),
            SizedBox(height: 25), // Отступ между изображением и текстом
            // Текст
            Text(
              text,
              style: TextStyles.navigateConStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
