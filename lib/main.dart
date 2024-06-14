import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Adicione esta linha
import 'package:glorie_lores/pages/details_page.dart';
import 'package:glorie_lores/pages/home_page.dart';
import 'package:glorie_lores/pages/login_page.dart';
import 'package:glorie_lores/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Mano',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        // Customize your dark theme here
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white24,
          hintStyle: TextStyle(color: Colors.white54),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          prefixIconColor: Colors.white54,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => LoginPage(),
        '/home': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
      },
    );
  }
}
