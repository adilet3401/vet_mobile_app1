import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../theme/text_styles.dart';
import '../widgets/navigate_button.dart';
import '../widgets/sign_in_to_google.dart';
import '../widgets/user_email_password.dart';

//crt option O
//command .
class RegistScreen extends StatefulWidget {
  const RegistScreen({super.key});

  @override
  State<RegistScreen> createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  String? nameError;
  String? phoneError;
  String? passwordError;
  String? confirmPasswordError;
  bool isLoading = false;

  Future<void> register() async {
    setState(() {
      nameError = null;
      phoneError = null;
      passwordError = null;
      confirmPasswordError = null;
      isLoading = true;
    });

    if (nameController.text.isEmpty) {
      setState(() {
        nameError = 'Толук аты жөнү жазыңыз';
        isLoading = false;
      });
      return;
    }

    if (phoneController.text.isEmpty) {
      setState(() {
        phoneError = "Телефон номериңизди же email жазыңыз";
        isLoading = false;
      });
      return;
    }

    // Обработка ввода (номер телефона или email)
    String input = phoneController.text.trim();
    String email;
    String? phone;

    if (RegExp(r'^\d+$').hasMatch(input)) {
      // Если это номер телефона
      phone = input.replaceAll(RegExp(r'[^0-9]'), '');
      if (!phone.startsWith('996')) {
        phone = '996$phone';
      }

      if (phone.length != 12) {
        setState(() {
          phoneError = "Номер телефона неверный";
          isLoading = false;
        });
        return;
      }

      email = '$phone@example.com'; // Преобразуем номер в email
    } else {
      // Если это email
      email = input;
      phone = null; // Телефон не указан
    }

    if (passwordController.text.isEmpty) {
      setState(() {
        passwordError = 'Сыр сөз жазыныз';
        isLoading = false;
      });
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        confirmPasswordError = 'Сыр сөздөр дал келбейт';
        isLoading = false;
      });
      return;
    }

    try {
      // Регистрация пользователя
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: passwordController.text.trim(),
      );

      // Сохранение данных пользователя в Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
            'name': nameController.text.trim(),
            'phone': phone,
            'email': email,
            'createAt': FieldValue.serverTimestamp(),
          });

      // ignore: unnecessary_null_comparison
      if (userCredential != null) {
        nameController.clear();
        phoneController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
      }

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Каттоо ийгиликтүү аяктады!'),
          backgroundColor: Colors.green,
        ),
      );

      // ignore: use_build_context_synchronously
      context.go('/login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Этот аккаунт уже существует'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'weak-password') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Пароль слишком простой'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Катто учурунда ката кетти'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Каттоо учурунда ката кетти'),
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
      appBar: AppBar(title: Text('Катталуу', style: TextStyles.appBarTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 200,
                    bottom: 80,
                    right: 0,
                    top: 20,
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
                            controller: nameController,
                            hinText: 'Таштанова Акылай',
                            icon: 'assets/Vector-12.svg',
                            errorText: nameError,
                            onChanged: (value) {
                              setState(() {
                                if (value.isNotEmpty) {
                                  nameError = null;
                                }
                              });
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Zа-яА-ЯёЁ\s]'),
                              ),
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
                            'Толук аты жөнү',
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
                            controller: phoneController,
                            hinText: '996 302 345 656 же email',
                            icon: 'assets/Vector-10.svg',
                            errorText: phoneError,
                            onChanged: (value) {
                              setState(() {
                                if (value.isNotEmpty) phoneError = null;
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
                                if (value.isNotEmpty) passwordError = null;
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
                            controller: confirmPasswordController,
                            hinText: '*********',
                            obsureText: true,
                            icon: 'assets/clarity_eye-line.svg',
                            errorText: confirmPasswordError,
                            onChanged: (value) {
                              setState(() {
                                if (value.isNotEmpty)
                                  // ignore: curly_braces_in_flow_control_structures
                                  confirmPasswordError = null;
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
                            'Сыр сөздү ырастоо',
                            style: TextStyles.buttonTextStyle.copyWith(
                              color: Color(0xff878787),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 46),
                NavigateButton(
                  text: 'Катталуу',
                  onPressed: isLoading ? null : register,
                  borderRadius: BorderRadius.circular(24),
                  minimumSize: Size(350, 48),
                  isLoading: isLoading,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Катталган аккаунтуңуз барбы?',
                      style: TextStyles.buttonTextStyle.copyWith(
                        color: Color(0xff878787),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        context.go('/login');
                      },
                      child: Text(
                        'Бул жерден кириңиз',
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
                SizedBox(height: 20),
                ButtonSignInToGoogle(),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
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
