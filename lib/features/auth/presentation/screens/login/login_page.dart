import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/shared/buttons/custom_icon_button.dart';
import '../../../../../widgets/shared/buttons/customs_elevated_buttons.dart';
import '../../../../../widgets/shared/inputs/customs_inputs.dart';
import '../../../../../widgets/shared/inputs/text_input_login.dart';
import '../../../../../widgets/shared/labes/custom_label.dart';
import '../../../../../widgets/shared/labes/labels_tittle_page.dart';
import '../../../domain/firebase_auth_services.dart';
import '../home/home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Header
          const _Header(),

          //Tittle Page
          const TittlePage(text: 'Iniciar sesión ',),
          
          //user
          TextFieldInput(
            controller: _email,
            tittleInput: 'Email',
            inputDecoration: CustomInputs.loginInputDecoration(
              hintInput: 'Ingrese su email',
              iconInput: Icons.email_outlined,
            ),
            onChaged: (value) {
              _email.text = value;
            },
          ),
          const SizedBox(height: 40,),

          //Password
          TextFieldInput(
            controller: _password,
            tittleInput: 'Contraseña',
            obscureText: true,
            inputDecoration: CustomInputs.passwordInputDecoration(
              hintInput: 'Ingrese su contraseña',
              iconInput: Icons.lock_outline,
            ),
            onChaged: (value) {
              _password.text = value;
            },
          ),

          //Remember
          const _RememberPass(),
          const SizedBox(height: 10,),

          //Forget password?
          const _ForgetPassword(),
          const SizedBox(height: 40,),

          //Button Sing in
          Center(
            child: CustomElevatedButton(
              width: 311,
              heigth: 53,
              text: 'Iniciar sesión',
              onPressed: () => _singIn()
            ),
          ),
          const SizedBox(height: 60,),

          //Link Sing Up
          const _LinkSingUp()
        ],      
      ),
    );
  }

  void _singIn() async {
    String email = _email.text;
    String password = _password.text;

    User? user = await _auth.singIn(email, password);

    if (user != null) {
      print('Usuario logeado!');
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage()));
    } else {
      print('Error al logear usuario');
    }

  }

}

class _LinkSingUp extends StatelessWidget {
  const _LinkSingUp();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('¿Aún no tienes cuenta?'),
        const SizedBox(width: 5,),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const RegisterPage()));
          },
          child: Text(
            'Registrate',
            style: CustomLabels.textLink,
          ),
        ),
      ],
    );
  }
}

class _ForgetPassword extends StatelessWidget {
  const _ForgetPassword();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: (){},
        child: Text(
          '¿Olvidaste tu contrasña?',
          style: CustomLabels.textLink,
        ),
      ),
    );
  }
}

class _RememberPass extends StatelessWidget {
  const _RememberPass();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value){}),
          
          const Text('Recordar contraseña')
        ],
      ),
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