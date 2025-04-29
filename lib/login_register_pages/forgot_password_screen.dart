import 'package:flutter/material.dart';

import '../theme/text_styles.dart';
import '../widgets/my_appbar.dart';
import '../widgets/navigate_button.dart';
import '../widgets/user_email_password.dart';

import 'forgot_password_screen2.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtils.customAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Сураныч катталган почтаңызды же телефон номуруңузду жазыңыз.',
              style: TextStyles.forgotPasswordScreenTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 40),
            UserEmailPasswordline(
              icon: 'assets/Vector-11.svg',
              hinText: "example@gmail.com",
            ),
            const SizedBox(height: 30),
            NavigateButton(
              text: 'Кийинки',
              borderRadius: BorderRadius.circular(20),
              minimumSize: Size(328, 50),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen2(),
                  ),
                );
              },
            ),
            const Spacer(),
            Text(
              '© МаралАкгул.Баардык укуктар корголгон',
              style: TextStyles.buttonTextStyle.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
