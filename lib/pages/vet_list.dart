import 'package:flutter/material.dart';
import 'package:vet_mobile_app/widgets/my_appbar.dart';

class VetListPage extends StatelessWidget {
  const VetListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarUtils.customAppBar(title: 'Ветеринар'));
  }
}
