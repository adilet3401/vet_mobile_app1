import 'package:flutter/material.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';

class AppBarUtils {
  static PreferredSizeWidget customAppBar({
    required String title,
    bool showProfileIcon = true, // Флаг для отображения иконки профиля
    VoidCallback? onProfileTap, // Действие при нажатии на иконку
  }) {
    return AppBar(
      actions:
          showProfileIcon
              ? [
                IconButton(
                  onPressed: onProfileTap,
                  icon: Image.asset(
                    'assets/Image logo-2.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ]
              : null,
      title: Text(title, style: TextStyles.appBarTitle),
    );
  }
}
