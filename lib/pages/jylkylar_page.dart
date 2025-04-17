import 'package:flutter/material.dart';
import 'package:vet_mobile_app/widgets/my_appbar.dart';

class JylkylarPage extends StatelessWidget {
  const JylkylarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarUtils.customAppBar(title: 'Жылкылар'));
  }
}
