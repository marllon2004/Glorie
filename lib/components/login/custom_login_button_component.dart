import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glorie_lores/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;

  const CustomLoginButtonComponent({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => inLoader ? CircularProgressIndicator() :
      ElevatedButton(
          onPressed: () {
            loginController.auth().then(
                    (result) {
                  if(result){
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Falha ao realizar login'),
                        duration: const Duration(seconds: 5),
                        action: SnackBarAction(
                          label: 'ACTION',
                          onPressed: () {},
                        ))
                    );
                  }
                }
            );
          },
          child: Text('Login')
      ),
    );
  }
}
