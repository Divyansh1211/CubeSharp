import 'package:cubesharp_assignment/catalogue_screen.dart';
import 'package:cubesharp_assignment/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: CatalogueScreen.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        CatalogueScreen.id: (context) => CatalogueScreen(),
      },
    );
  }
}
