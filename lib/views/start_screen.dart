import 'package:flutter/material.dart';
import 'package:spt_app/views/login.dart';

class StartScreen extends StatelessWidget {
  static const String routname = '/start_screen';
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              Text(
                "¡Bienvenido!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screen.width*0.08
                ),
              ),
              SizedBox(
                height: screen.height*0.1,
              ),
              Text(
                "Convierte la energía del sol en tu mejor aliado.",
                style: TextStyle(
                  fontSize: screen.width*0.038
                )
              ),
              Text(
                "¡Estas a un solo paso de hacerlo!",
                style: TextStyle(
                  fontSize: screen.width*0.038
                )
              ),
              SizedBox(
                height: screen.height*0.04,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF256EDC),
                  minimumSize: Size(screen.width*0.6, screen.height*0.045)
                ),
                onPressed: (){
                  Navigator.pushNamed(context, Login.routname);
                }, 
                child: Text(
                  "Continuar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screen.width*0.04
                  )
                )
              )
            ],
          ),
        ),
      )
    );
  }
}