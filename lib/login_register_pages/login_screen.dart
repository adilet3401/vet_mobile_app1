import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../theme/text_styles.dart';
import '../widgets/navigate_button.dart';
import '../widgets/sign_in_to_google.dart';
import '../widgets/user_email_password.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? passwordError;
  String? phoneError;
  bool isLoading = false;

  Future<void> signIn() async {
    setState(() {
      passwordError = null;
      phoneError = null;
      isLoading = true;
    });

    String input = phoneController.text.trim();
    String password = passwordController.text.trim();

    if (input.isEmpty) {
      setState(() {
        phoneError = 'Номер же email жазыныз';
        isLoading = false;
      });
      return;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = 'Сыр сөз жазыныз';
        isLoading = false;
      });
      return;
    }

    try {
      String email;

      if (RegExp(r'^\d+$').hasMatch(input)) {
        if (!input.startsWith('996')) {
          input = '996$input';
        }

        if (input.length != 12) {
          setState(() {
            phoneError = "Номер телефона неверный";
            isLoading = false;
          });
          return;
        }

        email = '$input@example.com';
      } else {
        email = input;
      }

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: use_build_context_synchronously
      context.go('/menu');
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => MenuPage()),
      // );
      // ignore: avoid_print
      print('Signed in!');
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Кирүүдө ката кетти, сыр соз же номер/email туура эмес',
            style: TextStyles.forgotPasswordScreenTextStyle.copyWith(
              color: Colors.white,
            ),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Аккаунтка кирүү', style: TextStyles.appBarTitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 200,
                    bottom: 145,
                    right: 0,
                    top: 0,
                  ),
                  child: InkWell(
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance
                            .signInAnonymously(); //ВХОД КАК ГОСТЬ
                        // ignore: use_build_context_synchronously
                        context.go('/menu');
                      } catch (e) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Кирүүдө ката кетти',
                              style: TextStyles.forgotPasswordScreenTextStyle
                                  .copyWith(color: Colors.white),
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Өткөрүп жиберүү',
                      textAlign: TextAlign.right,
                      style: TextStyles.buttonTextStyle.copyWith(
                        color: Color(0xff01A560),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 400,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: UserEmailPasswordline(
                            controller: phoneController,
                            hinText: '996 302 345 656 же email',
                            icon: 'assets/Vector-10.svg',
                            errorText: phoneError,
                            onChanged: (value) {
                              setState(() {
                                if (value.isNotEmpty) {
                                  phoneError = null;
                                }
                              });
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z0-9@.]'),
                              ),
                              LengthLimitingTextInputFormatter(60),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -28,
                        left: 1,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Телефон номери',
                            style: TextStyles.buttonTextStyle.copyWith(
                              color: Color(0xff878787),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 400,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: UserEmailPasswordline(
                            controller: passwordController,
                            hinText: '*********',
                            icon: 'assets/clarity_eye-line.svg',
                            errorText: passwordError,
                            obsureText: true,
                            onChanged: (value) {
                              setState(() {
                                if (value.isNotEmpty) {
                                  passwordError = null;
                                }
                              });
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z0-9]'),
                              ),
                              LengthLimitingTextInputFormatter(8),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -28,
                        left: 1,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Сыр сөз',
                            style: TextStyles.buttonTextStyle.copyWith(
                              color: Color(0xff878787),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgotPasswordScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Сыр сөзду унуттуңузбу?',
                        textAlign: TextAlign.right,
                        style: TextStyles.buttonTextStyle.copyWith(
                          color: Color(0xff01A560),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                NavigateButton(
                  text: 'Кирүү',
                  onPressed: isLoading ? null : signIn,
                  borderRadius: BorderRadius.circular(24),
                  minimumSize: Size(336, 50),
                  isLoading: isLoading,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Аккаунтуңуз жокпу?',
                      style: TextStyles.buttonTextStyle.copyWith(
                        color: Color(0xff878787),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        context.go('/register');
                      },
                      child: Text(
                        'Ушул жерден катталыңыз',
                        style: TextStyles.buttonTextStyle.copyWith(
                          color: Color(0xff01A560),
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xff99dbbf),
                        thickness: 1,
                        indent: 40,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      'Же',
                      style: TextStyles.buttonTextStyle.copyWith(
                        color: Color(0xff878787),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xff99dbbf),
                        thickness: 1,
                        indent: 10,
                        endIndent: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ButtonSignInToGoogle(),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    '© МаралАкгул.Баардык укуктар корголгон',
                    style: TextStyles.buttonTextStyle.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
