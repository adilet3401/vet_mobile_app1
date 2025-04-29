import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../widgets/my_appbar.dart';

class AccountPage extends StatelessWidget {
  final String name;
  final String phone;
  final String password;

  const AccountPage({
    super.key,
    required this.name,
    required this.phone,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtils.customAppBar(title: 'Колдонуучу'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SvgPicture.asset('')],
      ),
    );
  }
}
