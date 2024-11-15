import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/auth/header.dart';
import '../../../../widgets/shared/buttons/customs_elevated_buttons.dart';
import '../../../../widgets/shared/inputs/customs_inputs.dart';
import '../../../../widgets/shared/inputs/text_input_login.dart';
import '../../../../widgets/shared/labes/custom_label.dart';
import '../../../../widgets/shared/labes/labels_tittle_page.dart';
import '../../../domain/firebase_auth_services.dart';
import '../../../../widgets/shared/snack_bar.dart';
import '../../../../home/presentation/screen/home/home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header
          const Header(),

          //Tittle Page
          const TittlePage(text: 'Registro',),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                //Name
                TextFieldInput(
                  controller: _name,
                  tittleInput: 'Nombre y apellido',
                  inputDecoration: CustomInputs.loginInputDecoration(
                    hintInput: 'Ingrese su nombre',
                    iconInput: Icons.person_outlined,
                  ),
                  onChaged: (value) {
                    _name.text = value;
                  },
                ),
                const SizedBox(height: 20,),
                //Email
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
                const SizedBox(height: 20,),
                //Phone
                TextFieldInput(
                  controller: _phone,
                  tittleInput: 'Teléfono',
                  inputDecoration: CustomInputs.loginInputDecoration(
                    hintInput: 'Ingrese su numero de teléfono',
                    iconInput: Icons.phone_android_outlined,
                  ),
                  onChaged: (value) {
                    _phone.text = value;
                  },
                ),
                const SizedBox(height: 20,),
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
                const SizedBox(height: 20,),
                //Confirm Password
                TextFieldInput(
                  controller: _passwordConfirm,
                  tittleInput: 'Confirme contraseña',
                  obscureText: true,
                  inputDecoration: CustomInputs.passwordInputDecoration(
                    hintInput: 'Confirme la contraseña',
                    iconInput: Icons.lock_outline,
                  ),
                  onChaged: (value) {
                      _passwordConfirm.text = value;
                  },
                ),
                const SizedBox(height: 40,),
            
                //Button Sing in
                Center(
                  child: CustomElevatedButton(
                    width: 311,
                    heigth: 53,
                    text: 'Registrarme',
                    onPressed: () => _singUp(),
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

  void _singUp() async {
    String email = _email.text;
    String password = _password.text;

    User? user = await _auth.singUp(email, password);

    await Future.delayed(const Duration(seconds: 2));
    
    if (!mounted) return;

    if (user != null) {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage()));
    } else {
      CustomSnackBar(context: context).snackBar('Error al crear el usuario');
    }
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

