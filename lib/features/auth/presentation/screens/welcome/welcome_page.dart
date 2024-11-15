import 'package:flutter/material.dart';

import '../../../../widgets/shared/buttons/customs_elevated_buttons.dart';
import '../../../../widgets/welcome/background_image.dart';
import '../../../../widgets/welcome/logo.dart';
import '../login/login_page.dart';
import '../login/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background Image
          const BackgroundImage(),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Logo App
              const Logo(),

              Expanded(child: Container()),
              
              //Buttons Sign In / Sign Up
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    CustomElevatedButton(
                      width: 311,
                      heigth: 53,
                      opacity: 1,
                      text: 'Iniciar sesión',
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const LoginPage()));
                      },
                    ),
                    const SizedBox(height: 20,),
                    CustomElevatedButton(
                      width: 311,
                      heigth: 53,
                      color: const Color(0xffFBFBFB),
                      opacity: 0.4,
                      text: 'Registarme',
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const RegisterPage()));
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

