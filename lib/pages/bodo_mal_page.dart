import 'package:flutter/material.dart';

import '../widgets/my_appbar.dart';

class BodoMalPage extends StatelessWidget {
  const BodoMalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarUtils.customAppBar(title: 'Бодо мал'));
  }
}
