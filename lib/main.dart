import 'package:flutter/material.dart';
import 'package:ao_eleven/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:ao_eleven/screens/login.dart'; // tambahkan ini nanti setelah buat login.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider digunakan untuk membagikan CookieRequest ke seluruh widget
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Ao Eleven',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.blueAccent[400]),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
