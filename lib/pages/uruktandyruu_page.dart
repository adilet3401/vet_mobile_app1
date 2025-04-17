import 'package:flutter/material.dart';
import 'package:vet_mobile_app/widgets/my_appbar.dart';

class UruktandyruuPage extends StatelessWidget {
  const UruktandyruuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarUtils.customAppBar(title: 'Уруктандыруу'));
  }
}
