import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glorie_lores/components/login/custom_login_button_component.dart';
import 'package:glorie_lores/controllers/login_controller.dart';
import 'package:glorie_lores/widgets/custom_text_field_widget.dart';
import 'package:glorie_lores/widgets/gradient_background.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.people, size: MediaQuery.of(context).size.height * 0.2,),
              CustomTextFieldWidget(
                onChanged: _controller.setLogin,
                label: 'Login',
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                onChanged: _controller.setPass,
                label: 'Senha',
                obscureText: true,
              ),
              SizedBox(height: 15),
              CustomLoginButtonComponent(loginController: _controller,),
            ],
          ),
        ),
      ),
    );
  }
}
