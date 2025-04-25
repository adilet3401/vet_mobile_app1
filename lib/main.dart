import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vet_mobile_app/download_screen.dart';
import 'package:vet_mobile_app/firebase_options.dart';
import 'package:vet_mobile_app/go_auto_routes/go_router.dart';
import 'package:vet_mobile_app/theme/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Vet Mobile',
      theme: themeData(),
      // home: const DownloadScreen(),
    );
  }
}
//google sign in к симулятору айфон