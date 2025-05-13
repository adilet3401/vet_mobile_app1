import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/menu_page.dart';
import '../theme/text_styles.dart';

class ButtonSignInToGoogle extends StatefulWidget {
  const ButtonSignInToGoogle({super.key});

  @override
  State<ButtonSignInToGoogle> createState() => _ButtonSignInToGoogleState();
}

class _ButtonSignInToGoogleState extends State<ButtonSignInToGoogle> {
  bool isLoading = false;

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Инициализация GoogleSignIn
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // Пользователь отменил выбор аккаунта
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Создание учетных данных для Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Вход в Firebase
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      // Проверка: новый пользователь или уже существующий
      bool isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

      if (isNewUser) {
        // Сохранение данных нового пользователя в Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
              'name': userCredential.user!.displayName,
              'email': userCredential.user!.email,
              'photoURL': userCredential.user!.photoURL,
              'createAt': FieldValue.serverTimestamp(),
            });

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Регистрация через Google выполнена успешно!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Вы уже зарегистрированы. Выполнен вход.'),
            backgroundColor: Colors.blue,
          ),
        );
      }

      // Перенаправление на главную страницу
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => MenuPage()),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка регистрации через Google: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Color(0xff99dbbf), width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      onPressed: isLoading ? null : () => signInWithGoogle(context),
      child:
          isLoading
              ? CircularProgressIndicator()
              : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/Group 49.png', width: 20, height: 20),
                  SizedBox(width: 10),
                  Text(
                    'Google',
                    style: TextStyles.buttonTextStyle.copyWith(
                      color: Color(0xff878787),
                    ),
                  ),
                ],
              ),
    );
  }
}
