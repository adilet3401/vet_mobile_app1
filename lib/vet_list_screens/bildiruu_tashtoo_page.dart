import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';
import 'package:vet_mobile_app/vet_list_screens/line_the_bildiruu_tashtoo.dart';
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
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  LineTheBilTash(
                    hintext: 'Аты жөнү',
                    icon: 'assets/Vector.png',
                  ),
                  SizedBox(height: 20),
                  LineTheBilTash(
                    hintext: 'Телефон номуруңуз',
                    icon: 'assets/Vector-2.png',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 21),
            Stack(
              children: [
                TextFormField(
                  maxLines: 9,
                  decoration: InputDecoration(
                    prefixIcon: Padding(padding: EdgeInsets.all(15)),
                    // labelText: labelText,
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
                  ),
                ),
                Positioned(
                  top: 16, // Расположение иконки сверху
                  left: 9, // Расположение иконки слева
                  child: Icon(Icons.mode_edit_outlined, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [],
            // ),
            SizedBox(height: 30),
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
  // Widget _buildInputField(
  //   BuildContext context, {
  //   required IconData icon,
  //   required String hintText,
  //   IconData? suffixIcon,
  //   Color? suffixIconColor,
  // }) {
  //   return TextField(
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(icon, color: Colors.green),
  //       suffixIcon:
  //           suffixIcon != null
  //               ? Icon(suffixIcon, color: suffixIconColor)
  //               : null,
  //       hintText: hintText,
  //       hintStyle: const TextStyle(color: Colors.grey),
  //       filled: true,
  //       fillColor: Colors.white,
  //       contentPadding: const EdgeInsets.symmetric(vertical: 15),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         // ignore: deprecated_member_use
  //         borderSide: BorderSide(color: Colors.green.withOpacity(0.5)),
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         // ignore: deprecated_member_use
  //         borderSide: BorderSide(color: Colors.green.withOpacity(0.5)),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: const BorderSide(color: Colors.green),
  //       ),
  //     ),
  //   );
  // }

  // Поле для текста

  // Кнопка действия
  //   Widget _buildActionButton(
  //     BuildContext context, {
  //     required IconData icon,
  //     required String label,
  //   }) {
  //     return Container(
  //       width: MediaQuery.of(context).size.width * 0.4,
  //       padding: const EdgeInsets.symmetric(vertical: 15),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(24),
  //         // ignore: deprecated_member_use
  //         border: Border.all(color: Colors.green.withOpacity(0.5)),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(icon, color: Colors.green),
  //           const SizedBox(width: 8),
  //           Text(
  //             label,
  //             style: const TextStyle(color: Colors.black, fontSize: 14),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
}
