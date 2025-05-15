import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';
import 'package:vet_mobile_app/vet_list_screens/line_the_bildiruu_tashtoo.dart';
import 'package:vet_mobile_app/widgets/my_appbar.dart';
import 'package:vet_mobile_app/widgets/navigate_button.dart';

class BildiruuTashtooPage extends StatefulWidget {
  const BildiruuTashtooPage({super.key});

  @override
  State<BildiruuTashtooPage> createState() => _BildiruuTashtooPageState();
}

class _BildiruuTashtooPageState extends State<BildiruuTashtooPage> {
  // Контроллеры для полей ввода
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  // Переменные для ошибок
  String? nameError;
  String? phoneError;
  String? feedbackError;
  bool isLoading = false;

  // Функция для отправки данных в Firestore
  Future<void> submitFeedback() async {
    setState(() {
      nameError = null;
      phoneError = null;
      feedbackError = null;
      isLoading = true;
    });

    // Валидация полей
    if (nameController.text.isEmpty) {
      setState(() {
        nameError = 'Аты жөнүңүздү жазыңыз';
        isLoading = false;
      });
      return;
    }

    if (phoneController.text.isEmpty) {
      setState(() {
        phoneError = 'Телефон номуруңузду жазыңыз';
        isLoading = false;
      });
      return;
    }

    if (feedbackController.text.isEmpty) {
      setState(() {
        feedbackError = 'Текст жазыңыз';
        isLoading = false;
      });
      return;
    }

    try {
      // ignore: avoid_print
      print('Попытка записи в Firestore...');
      await FirebaseFirestore.instance.collection('feedbacks').add({
        'name': nameController.text.trim(),
        'phone': phoneController.text.trim(),
        'feedback': feedbackController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });
      // ignore: avoid_print
      print('Данные успешно записаны в Firestore!');

      // Очистка полей
      nameController.clear();
      phoneController.clear();
      feedbackController.clear();

      // Переход на страницу успеха
      // ignore: use_build_context_synchronously
      context.push('/feedback-success');
    } catch (e) {
      // ignore: avoid_print
      print('Ошибка при записи в Firestore: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ката кетти: $e'), backgroundColor: Colors.red),
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
      appBar: AppBarUtils.customAppBar(title: 'Ветеринар'),
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Center(
              child: Text(
                'Ветеринарга билдирүү таштоо',
                style: TextStyles.bTashtoo.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 19),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  LineTheBilTash(
                    controller: nameController,
                    hintext: 'Аты жөнү',
                    icon: 'assets/Vector.png',
                    errorText: nameError,
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) nameError = null;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  LineTheBilTash(
                    controller: phoneController,
                    hintext: 'Телефон номуруңуз',
                    icon: 'assets/Vector-2.png',
                    errorText: phoneError,
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) phoneError = null;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 21),
            Stack(
              children: [
                TextFormField(
                  controller: feedbackController,
                  maxLines: 9,
                  decoration: InputDecoration(
                    prefixIcon: Padding(padding: EdgeInsets.all(15)),
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIconColor: Colors.grey,
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 25,
                      minHeight: 25,
                    ),
                    hintText: '  Текст',
                    hintStyle: TextStyles.buttonTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff99dbbf),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff01A560),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    errorText: feedbackError,
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value.isNotEmpty) feedbackError = null;
                    });
                  },
                ),
                Positioned(
                  top: 16,
                  left: 9,
                  child: Icon(Icons.mode_edit_outlined, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(height: 30),
            Center(
              child: NavigateButton(
                text: 'Жиберүү',
                borderRadius: BorderRadius.circular(24),
                minimumSize: Size(307, 48),
                onPressed: isLoading ? null : submitFeedback,
                isLoading: isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    feedbackController.dispose();
    super.dispose();
  }
}
