import 'package:flutter/material.dart';
import 'dart:async';
import 'package:go_router/go_router.dart'; // Импорт GoRouter

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100), // Длительность анимации
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    Timer(const Duration(seconds: 2), () {
      _animationController.forward().then((_) {
        // Используем GoRouter для перехода
        context.go('/flash_screen'); // Переход на маршрут '/home'
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Image.asset('assets/logotip.png', width: 150, height: 150),
        ),
      ),
    );
  }
}
