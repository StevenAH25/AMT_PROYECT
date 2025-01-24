import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spt_app/views/start_screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    var user = FirebaseAuth.instance.currentUser;
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              color: const Color(0xFF256EDC),
              height: screen.height*0.36,
              width: screen.width,
            ),
            Padding(
            padding: EdgeInsets.all(screen.width*0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¡Bienvenido!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screen.width*0.1
                  ),
                ),
                SizedBox(
                  height: screen.height*0.05,
                ),
                user != null && user.photoURL != null
                ? CircleAvatar(
                    radius: screen.height*0.08,
                    backgroundImage: NetworkImage(user.photoURL!),
                  )
                : Icon(
                    color: const Color(0xFF256EDC),
                    Icons.account_circle,
                    size: screen.height*0.175,
                  ),
                SizedBox(
                  height: screen.height*0.05,
                ),
                Row(
                  children: [
                    Text(
                      'Nombre: ',
                      style: TextStyle(
                        fontSize: screen.width*0.055,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '${user?.displayName}',
                      style: TextStyle(
                        fontSize: screen.width*0.055,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screen.height*0.03,
                ),
                Row(
                  children: [
                    Text(
                      'Correo: ',
                      style: TextStyle(
                        fontSize: screen.width*0.055,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '${user?.email}',
                      style: TextStyle(
                        fontSize: screen.width*0.055,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screen.height*0.03,
                ),
                Row(
                  children: [
                    Text(
                      'Teléfono: ',
                      style: TextStyle(
                        fontSize: screen.width*0.055,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      user != null ? user.phoneNumber ?? 'número no disponible' : 'número no disponible',
                      style: TextStyle(
                        fontSize: screen.width*0.055,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screen.height*0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cerrar sesión ',
                      style: TextStyle(
                        fontSize: screen.width*0.055,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        size: screen.height*0.05,
                        color: const Color(0xFF256EDC),
                      ),
                      onPressed:() async{
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(context, StartScreen.routname);
                      }
                    ),
                  ],
                ),
              ],
            ),
          ),
          ],
          
        ),
      ),
    );
  }
}