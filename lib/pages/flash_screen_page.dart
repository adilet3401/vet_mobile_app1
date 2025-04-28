import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';
import 'package:vet_mobile_app/widgets/navigate_button.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Фоновое изображение
          Positioned(
            //COW
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/cow.png',
              fit: BoxFit.fitWidth,
            ), // Замените 'assets/cow.png' на путь к вашему изображению
          ),
          Positioned(
            //LOGOTYPE
            top: 110,
            left: 57,
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                'assets/logo.png',
              ), // Замените 'assets/logo.svg' на путь к вашему SVG
            ),
          ),
          // Основной контент
          Positioned(
            //Title and button
            top: 250,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Кош келдиңиз!',
                    style: TextStyles.textStyleInFlashScreen,
                  ),
                  Text(
                    'Мал жандыгыңызды асыроону биз менен баштаңыз.',
                    style: TextStyles.textStyleInFlashScreen2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  NavigateButton(
                    //BUTTON
                    text: 'Баштоо',
                    borderRadius: BorderRadius.circular(20),

                    onPressed: () {
                      context.go('/login');
                    },
                    minimumSize: Size(308, 50),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
