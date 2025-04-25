import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:vet_mobile_app/login_register_pages/email_phone_name_edit_line.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';
import 'package:vet_mobile_app/widgets/navigate_button.dart';

//e8f6f1
class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, dynamic>? userData;
  bool isLoading = true;

  // Контроллеры для полей ввода
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      User? currentUser = _auth.currentUser; // Получаем текущего пользователя
      if (currentUser != null) {
        DocumentSnapshot userDoc =
            await _firestore
                .collection('users') // Коллекция "users"
                .doc(currentUser.uid) // Документ по UID пользователя
                .get();

        setState(() {
          userData = userDoc.data() as Map<String, dynamic>?;
          isLoading = false;
          // Устанавливаем начальные значения для контроллеров
          nameController.text = userData?['name'] ?? '';
          phoneController.text = userData?['phone']?.split('@')[0] ?? '';
        });
      }
    } catch (e) {
      print('Ошибка при загрузке данных пользователя: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _saveUserData() async {
    try {
      User? currentUser = _auth.currentUser; // Получаем текущего пользователя
      if (currentUser != null) {
        await _firestore.collection('users').doc(currentUser.uid).update({
          'name': nameController.text, // Сохраняем новое имя
          'phone': phoneController.text, // Сохраняем новый телефон
        });

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Данные успешно сохранены!')));
      }
    } catch (e) {
      print('Ошибка при сохранении данных пользователя: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ошибка при сохранении данных')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профилди ондоо', style: TextStyles.appBarTitle),
      ),
      body: Stack(
        children: [
          isLoading
              ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xff01A560),
                  strokeWidth: 3,
                ),
              )
              : userData == null
              ? Center(child: Text('Не удалось загрузить данные аккаунта'))
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/perssson.png'),
                    ),
                    SizedBox(height: 15),
                    Divider(color: Colors.grey, height: 23, thickness: 0.4),
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
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
                              child: EmailPhoneNameEditLine(
                                hinText: userData!['name'] ?? 'Имя не указано',
                                controller:
                                    nameController, // Привязка контроллера
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Zа-яА-ЯёЁ\s]'),
                                  ), // Только буквы и пробелы
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
                                'Толук аты',
                                style: TextStyles.buttonTextStyle.copyWith(
                                  color: Color(0xff878787),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
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
                              child: EmailPhoneNameEditLine(
                                hinText:
                                    userData!['phone']?.split('@')[0] ??
                                    'Телефон не указан',
                                controller:
                                    phoneController, // Привязка контроллера
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z0-9@.]'),
                                  ),
                                  LengthLimitingTextInputFormatter(12),
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
                    SizedBox(height: 40),
                    NavigateButton(
                      text: 'Сактоо',
                      borderRadius: BorderRadius.circular(20),
                      minimumSize: Size(307, 48),
                      onPressed: _saveUserData, // Логика сохранения
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
