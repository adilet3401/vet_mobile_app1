import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vet_mobile_app/pages/news_page.dart';
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
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory, // Отключение эффекта нажатия
            highlightColor: Colors.transparent, // Убираем подсветку
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
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
      icon: Container(
        decoration: BoxDecoration(
          color:
              myCurrentIndex == currentIndex ? Colors.white : Color(0xff01a560),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(10), // Отступы для иконки
        child: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          color:
              myCurrentIndex == currentIndex ? Color(0xff01A560) : Colors.white,
        ),
      ),
      label: '',
    );
  }
}
