import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vet_mobile_app/account_pages/account_edit_page.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';

//e8f6f1
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      User? currentUser = _auth.currentUser; // Получаем текущего пользователя
      if (currentUser != null) {
        if (currentUser.isAnonymous) {
          // Если пользователь гость
          setState(() {
            userData = {
              'name': 'Гостевой пользователь',
              'email': 'Ошибка',
              'phone': 'Ошибка',
            };
            isLoading = false;
          });
        } else {
          // Если пользователь зарегистрирован
          DocumentSnapshot userDoc =
              await _firestore
                  .collection('users') // Коллекция "users"
                  .doc(currentUser.uid) // Документ по UID пользователя
                  .get();

          setState(() {
            userData = userDoc.data() as Map<String, dynamic>?;
            isLoading = false;
          });
        }
      }
    } catch (e) {
      print('Ошибка при загрузке данных пользователя: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Колдонуучу', style: TextStyles.appBarTitle)),
      body: Stack(
        children: [
          // Основное содержимое страницы
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
                    Text(
                      userData!['name'] ?? 'Ошибка',
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 15),
                    Divider(color: Colors.grey, height: 23, thickness: 0.4),
                    SizedBox(height: 15),
                    ListTile(
                      leading: Image.asset(
                        'assets/email.icon.png',
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        userData!['email'] ?? 'Ошибка',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      leading: Image.asset(
                        'assets/phone.png',
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        userData!['phone'] ?? 'Ошибка',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileEdit(),
                          ),
                        );
                      },
                      leading: Image.asset(
                        'assets/settings.png',
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        'Settings',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
          // Округлая форма внизу
          if (!isLoading)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 170, // Высота формы
                decoration: BoxDecoration(
                  color: Color(0xffe8f6f1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      180,
                    ), // Закругление верхнего левого угла
                    topRight: Radius.circular(
                      180,
                    ), // Закругление верхнего правого угла
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
