import 'package:flutter/material.dart';

import '../theme/text_styles.dart';
import '../widgets/my_appbar.dart';

class BizJonundoPage extends StatelessWidget {
  const BizJonundoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtils.customAppBar(title: 'Биз жөнүндө'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Тема', style: TextStyles.appBarTitle),
            Text(
              "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
              style: TextStyles.buttonTextStyle.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
