import 'package:flutter/material.dart';
// import 'package:vet_mobile_app/login_register_pages/forgot_password_screen2.dart';
import 'package:vet_mobile_app/pages/menu_page.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';
import 'package:vet_mobile_app/widgets/my_appbar.dart';
import 'package:vet_mobile_app/widgets/navigate_button.dart';
import 'package:vet_mobile_app/widgets/user_email_password.dart';

class ChagePasswordScreen extends StatefulWidget {
  const ChagePasswordScreen({super.key});

  @override
  State<ChagePasswordScreen> createState() => _ChagePasswordScreenState();
}

class _ChagePasswordScreenState extends State<ChagePasswordScreen> {
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
              icon: 'assets/Vector-13.svg',
              hinText: "Жаңы код",
            ),
            const SizedBox(height: 28),
            UserEmailPasswordline(
              icon: 'assets/Vector-13.svg',
              hinText: "Жаңы кодду кайталаңыз",
            ),
            const SizedBox(height: 30),
            NavigateButton(
              text: 'Сыр сөздү алмаштыруу',
              borderRadius: BorderRadius.circular(20),
              minimumSize: Size(328, 50),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
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
