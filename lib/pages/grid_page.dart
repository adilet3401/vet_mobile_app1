import 'package:flutter/material.dart';
import 'package:vet_mobile_app/login_register_pages/account_page.dart';
import 'package:vet_mobile_app/pages/biz_jonundo_page.dart';
import 'package:vet_mobile_app/pages/bodo_mal_page.dart';
import 'package:vet_mobile_app/pages/jylkylar_page.dart';
import 'package:vet_mobile_app/pages/koi_echkiler_page.dart';
import 'package:vet_mobile_app/pages/ooruu_page.dart';
import 'package:vet_mobile_app/pages/took_page.dart';
import 'package:vet_mobile_app/pages/toyut_page.dart';
import 'package:vet_mobile_app/pages/uruktandyruu_page.dart';
import 'package:vet_mobile_app/widgets/my_appbar.dart';
import 'package:vet_mobile_app/widgets/navigation_container.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtils.customAppBar(
        title: 'Меню',
        onProfileTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountPage()),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 64,
          right: 64,
          top: 20,
          bottom: 40,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          children: [
            NavigationContainer(
              image: 'assets/Vector.svg',
              text: 'Биз жөнүндө',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BizJonundoPage()),
                );
              },
            ),
            NavigationContainer(
              image: 'assets/Vector-2.svg',
              text: 'Тоют',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ToyutPage()),
                );
              },
            ),
            NavigationContainer(
              image: 'assets/Group.svg',
              text: 'Уруктандыруу',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UruktandyruuPage()),
                );
              },
            ),
            NavigationContainer(
              image: 'assets/Vector-3.svg',
              text: 'Ооруу',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OoruuPage()),
                );
              },
            ),
            NavigationContainer(
              image: 'assets/Group-2.svg',
              text: 'Бодо мал',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BodoMalPage()),
                );
              },
            ),
            NavigationContainer(
              image: 'assets/Vector-4.svg',
              text: 'Кой эчкилер',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KoiEchkilerPage()),
                );
              },
            ),
            NavigationContainer(
              image: 'assets/Vector-5.svg',
              text: 'Жылкылар',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JylkylarPage()),
                );
              },
            ),
            NavigationContainer(
              image: 'assets/Vector-6.svg',
              text: 'Тоок',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TookPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
