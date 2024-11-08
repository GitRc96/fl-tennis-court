import 'package:flutter/material.dart';

import '../../widgets/shared/buttons/custom_icon_button.dart';
import '../../widgets/shared/buttons/customs_elevated_buttons.dart';
import '../../widgets/shared/inputs/customs_inputs.dart';
import '../../widgets/shared/inputs/text_input_login.dart';
import '../../widgets/shared/labes/custom_label.dart';
import '../../widgets/shared/labes/labels_tittle_page.dart';
import '../home/home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header
          const _Header(),

          //Tittle Page
          const TittlePage(text: 'Registro',),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                //Name
                TextFieldInput(
                  tittleInput: 'Nombre y apellido',
                  inputDecoration: CustomInputs.loginInputDecoration(
                    hintInput: 'Ingrese su nombre',
                    iconInput: Icons.person_outlined,
                  ),
                ),
                const SizedBox(height: 20,),
                //Email
                TextFieldInput(
                  tittleInput: 'Email',
                  inputDecoration: CustomInputs.loginInputDecoration(
                    hintInput: 'Ingrese su email',
                    iconInput: Icons.email_outlined,
                  ),
                ),
                const SizedBox(height: 20,),
                //Phone
                TextFieldInput(
                  tittleInput: 'Teléfono',
                  inputDecoration: CustomInputs.loginInputDecoration(
                    hintInput: 'Ingrese su numero de teléfono',
                    iconInput: Icons.phone_android_outlined,
                  ),
                ),
                const SizedBox(height: 20,),
                //Password
                TextFieldInput(
                  tittleInput: 'Contraseña',
                  obscureText: true,
                  inputDecoration: CustomInputs.passwordInputDecoration(
                    hintInput: 'Ingrese su contraseña',
                    iconInput: Icons.lock_outline,
                  ),
                ),
                const SizedBox(height: 20,),
                //Confirm Password
                TextFieldInput(
                  tittleInput: 'Confirme contraseña',
                  obscureText: true,
                  inputDecoration: CustomInputs.passwordInputDecoration(
                    hintInput: 'Confirme la contraseña',
                    iconInput: Icons.lock_outline,
                  ),
                ),
                const SizedBox(height: 40,),
            
                //Button Sing in
                Center(
                  child: CustomElevatedButton(
                    width: 311,
                    heigth: 53,
                    text: 'Registrarme',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage())),
                  ),
                ),
                const SizedBox(height: 60,),
            
                //Link Sing Up
                const _LinkSingIn(),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ],      
      ),
    );
  }
}

class _LinkSingIn extends StatelessWidget {
  const _LinkSingIn();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Ya tengo cuenta'),
        const SizedBox(width: 5,),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage()));
          },
          child: Text(
            'Iniciar sesión',
            style: CustomLabels.textLink,
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/image/header.png'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: CustomIconButton() 
        ),
      ],
    );
  }
}