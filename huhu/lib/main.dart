import 'package:flutter/material.dart';
import '/helpers/user_info.dart';
import '/ui/beranda.dart';
import '/ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dongeng APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue, // Warna utama aplikasi
        hintColor: Colors.orangeAccent, // Warna aksen aplikasi
        fontFamily: 'Roboto', // Font default untuk aplikasi
        textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold), // Gaya teks untuk judul halaman
          bodyMedium: TextStyle(
              fontSize: 16.0, color: Colors.black87), // Gaya teks untuk konten
        ),
      ),
      home: token == null ? Login() : Beranda(),
    );
  }
}
