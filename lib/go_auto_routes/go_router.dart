import 'package:go_router/go_router.dart';

import '../download_screen.dart';
import '../login_register_pages/login_screen.dart';
import '../login_register_pages/register_page.dart';
import '../pages/bildiruu_tashtoo_page.dart';
import '../pages/flash_screen_page.dart';
import '../pages/menu_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => DownloadScreen()),
    GoRoute(path: '/flash_screen', builder: (context, state) => FlashScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/register', builder: (context, state) => RegistScreen()),
    GoRoute(path: '/menu', builder: (context, state) => MenuPage()),
    GoRoute(path: '/b_t', builder: (context, state) => BildiruuTashtooPage()),
  ],
);
