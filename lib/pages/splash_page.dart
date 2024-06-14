import 'package:flutter/material.dart';
import 'package:glorie_lores/services/prefs_service.dart';
import 'package:glorie_lores/widgets/gradient_background.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      PrefsService.isAuth(),
      Future.delayed(Duration(seconds: 3)),
    ]).then((value) => value[0]
        ? Navigator.of(context).pushReplacementNamed('/home')
        : Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Transform.scale(
              scale: 0.5, // Defina o fator de escala desejado
              child: Image.asset('assets/images/glorePNG.png'),
            ),
          ),
          Positioned(
            bottom: 100, // Ajuste a posição vertical conforme necessário
            child: CircularProgressIndicator(
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }
}