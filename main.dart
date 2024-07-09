import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CartProvider ();
      },
      child: MaterialApp(
          title: "Shopping App",
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              titleMedium: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            colorScheme: ColorScheme.fromSeed(
              primary: const Color.fromRGBO(254, 206, 1, 1),
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              prefixIconColor: Colors.black54,
            ),
          ),
          home: const HomePage()),
    );
  }
}
