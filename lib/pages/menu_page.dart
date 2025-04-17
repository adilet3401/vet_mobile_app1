import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vet_mobile_app/pages/news_menu.dart';
import 'package:vet_mobile_app/pages/vet_list.dart';
import 'package:vet_mobile_app/pages/grid_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int myCurrentIndex = 0;
  late PageController _pageController; //PageController

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: myCurrentIndex,
    ); // Инициализация PageController
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> pages = const [MenuGrid(), NewsPage(), VetListPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(40), // Скругление углов
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          // selectedItemColor: Colors.white, // Цвет для выбранного элемента
          // ignore: deprecated_member_use
          // unselectedItemColor: Colors.white.withOpacity(
          //   0.6,
          // ), // Цвет для невыбранных элементов
          // selectedLabelStyle: TextStyle(
          //   color: Colors.white,
          //   fontWeight: FontWeight.w500,
          // ),
          currentIndex: myCurrentIndex,
          onTap: (index) {
            setState(() {
              myCurrentIndex = index;
            });
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 230),
              curve: Curves.easeInOut,
            );
          },
          items: [
            BottomNavBar('assets/Vector-7.svg', 0),
            BottomNavBar('assets/Vector-8.svg', 1),
            BottomNavBar('assets/Group-3.svg', 2),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          myCurrentIndex = index;
        },
        children: pages,
      ),
    );
  }

  BottomNavigationBarItem BottomNavBar(String iconPath, int currentIndex) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        backgroundColor:
            myCurrentIndex == currentIndex ? Colors.white : Color(0xff01a560),
        minRadius: 26,
        child: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          // ignore: deprecated_member_use
          color:
              myCurrentIndex == currentIndex ? Color(0xff01A560) : Colors.white,
        ),
      ),
      label: '',
    );
  }
}
