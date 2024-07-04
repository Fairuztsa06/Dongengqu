import 'package:flutter/material.dart';
// ignore: unused_import
import 'login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti dengan logo atau gambar aplikasi
            Icon(
              Icons.book,
              size: 100,
              color: Colors.pink,
            ),
            SizedBox(height: 20),
            Text(
              'Cerita Dongeng',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
