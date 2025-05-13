import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';
import 'package:vet_mobile_app/widgets/my_appbar.dart';
import 'package:vet_mobile_app/widgets/navigate_button.dart';

class BildiruuTashtooPage extends StatelessWidget {
  const BildiruuTashtooPage({super.key});

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
            // Поле ввода имени
            _buildInputField(
              context,
              icon: Icons.person,
              hintText: 'Аты жөнү',
              suffixIcon: Icons.check_circle,
              suffixIconColor: Colors.green,
            ),
            const SizedBox(height: 14),
            // Поле ввода телефона
            //new commit the test
            _buildInputField(
              context,
              icon: Icons.phone,
              hintText: 'Телефон номуруңуз',
              suffixIcon: Icons.cancel,
              suffixIconColor: Colors.red,
            ),
            const SizedBox(height: 14),
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
            SizedBox(height: 30),
            // Кнопка "Жиберүү"
            Center(
              child: NavigateButton(
                text: 'Жиберүү',
                borderRadius: BorderRadius.circular(24),
                minimumSize: Size(307, 48),
                onPressed: () {
                  context.push('/b_t');
                },
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
          // ignore: deprecated_member_use
          borderSide: BorderSide(color: Colors.green.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // ignore: deprecated_member_use
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
          borderRadius: BorderRadius.circular(24),
          // ignore: deprecated_member_use
          borderSide: BorderSide(color: Colors.green.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          // ignore: deprecated_member_use
          borderSide: BorderSide(color: Colors.green.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
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
        borderRadius: BorderRadius.circular(24),
        // ignore: deprecated_member_use
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
