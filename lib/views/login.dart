import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spt_app/services/auth_google.dart';
import 'package:spt_app/views/bottom_dashboard.dart';


class Login extends StatelessWidget {
  static const String routname = '/login';
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
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
              height: screen.height*0.09
            ),
            Text(
              "Ingresa usando",
              style: TextStyle(
                fontSize: screen.width*0.05
              ),
            ),
            SizedBox(
              height: screen.height*0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    size: screen.height*0.05,
                    color: Colors.red,
                  ),
                  onPressed: () async{
                    try{
                      final authUser = AuthUser();
                      final user = await authUser.loginGoogle();
                      if (user != null){
                        Navigator.pushNamed(context, BottomDashboard.routname);
                      }
                      
                    } on FirebaseAuthException catch(error){
                      print(error.message);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error.message??'Ups...Algo salió mal')
                        )
                      );
                    } catch (e){
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString())
                        )
                      );
                    }
                    
                    
                  },
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.facebook,
                    size: screen.height*0.05,
                    color: Colors.blue[900],
                  ),
                  onPressed:(){
                    Navigator.pushNamed(context, BottomDashboard.routname);
                  }
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.xTwitter,
                    size: screen.height*0.05,
                    color: Colors.black,
                  ),
                  onPressed:(){
                    Navigator.pushNamed(context, BottomDashboard.routname);
                  }
                ), 
              ]
            ),
          ],
        ),
      )
    );
  }
}