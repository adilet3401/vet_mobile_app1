import 'package:flutter/material.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';

class BildiruuTashtooPage extends StatelessWidget {
  const BildiruuTashtooPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ветеринар', style: TextStyles.appBarTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            const SizedBox(height: 20),

            // Поле ввода имени
            _buildInputField(
              context,
              icon: Icons.person,
              hintText: 'Аты жөнү',
              suffixIcon: Icons.check_circle,
              suffixIconColor: Colors.green,
            ),
            const SizedBox(height: 15),

            // Поле ввода телефона
            _buildInputField(
              context,
              icon: Icons.phone,
              hintText: 'Телефон номуруңуз',
              suffixIcon: Icons.cancel,
              suffixIconColor: Colors.red,
            ),
            const SizedBox(height: 15),

            // Поле ввода текста
            _buildTextArea(context, icon: Icons.edit, hintText: 'Текст'),
            const SizedBox(height: 15),

            // Кнопки "Сүрөт жүктөө" и "Баасы"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(
                  context,
                  icon: Icons.camera_alt,
                  label: 'Сүрөт жүктөө',
                ),
                _buildActionButton(
                  context,
                  icon: Icons.attach_money,
                  label: 'Баасы',
                ),
              ],
            ),
            const Spacer(),

            // Кнопка "Жиберүү"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Логика отправки
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Жиберүү',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Поле ввода
  Widget _buildInputField(
    BuildContext context, {
    required IconData icon,
    required String hintText,
    IconData? suffixIcon,
    Color? suffixIconColor,
  }) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.green),
        suffixIcon:
            suffixIcon != null
                ? Icon(suffixIcon, color: suffixIconColor)
                : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  // Поле для текста
  Widget _buildTextArea(
    BuildContext context, {
    required IconData icon,
    required String hintText,
  }) {
    return TextField(
      maxLines: 5,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.green),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(60),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  // Кнопка действия
  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
