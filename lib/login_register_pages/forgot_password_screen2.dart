import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vet_mobile_app/login_register_pages/change_password_screen.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';
import 'package:vet_mobile_app/widgets/my_appbar.dart';
// import 'package:vet_mobile_app/widgets/navigate_button.dart';

class ForgotPasswordScreen2 extends StatefulWidget {
  const ForgotPasswordScreen2({super.key});

  @override
  State<ForgotPasswordScreen2> createState() => _ForgotPasswordScreen2State();
}

class _ForgotPasswordScreen2State extends State<ForgotPasswordScreen2> {
  String _enteredCode = ''; // Переменная для хранения введенного кода

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtils.customAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Биз өзгөртүү кодун жибердик.',
              style: TextStyles.forgotPasswordScreenTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Сиздин катталган электрондук почтаңызга же телефон номуруңузга өзгөртүү кодун жиберилди.',
              style: TextStyles.buttonTextStyle.copyWith(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                setState(() {
                  _enteredCode = value; // Обновляем введенный код
                });
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeColor: const Color(0xff01A560),
                selectedColor: const Color(0xff01A560),
                inactiveColor: const Color(0xffd6d6d6),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed:
                  _enteredCode.length == 6
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChagePasswordScreen(),
                          ),
                        );
                      }
                      : null, // Кнопка неактивна, если код не заполнен
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _enteredCode.length == 6
                        ? const Color(0xff01A560)
                        : const Color(0xffd6d6d6), // Цвет кнопки
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(307, 50),
              ),
              child: Text(
                'Аткарылды',
                style: TextStyles.buttonTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
