import 'package:flutter/material.dart';
import 'package:spt_app/services/realtime_database.dart';

class Control extends StatefulWidget {
  const Control({super.key});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  final RealtimeDatabase _realtimeDatabase = RealtimeDatabase();
  double _rotacion1 = 90; // Valor inicial para el servomotor 1
  double _rotacion2 = 90; // Valor inicial para el servomotor 2

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screen.width*0.01),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: screen.height*0.2,
                width: screen.width*0.5,
              ),
              Text(
                "Ajusta el panel solar a tu conveniencia",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screen.width*0.05
                )
              ),
              SizedBox(
                height: screen.height*0.1,
              ),
              Text(
                'Control de Servomotor 1',
                style: TextStyle(
                  fontSize: screen.width*0.045
                ),
              ),
              Slider(
                value: _rotacion1,
                min: 0,
                max: 180,
                divisions: 180,
                activeColor: const Color(0xFF256EDC),
                label: _rotacion1.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _rotacion1 = value;
                  });
                },
                onChangeEnd: (double value) {
                  _realtimeDatabase.actualizarMovimiento(_rotacion1, _rotacion2);
                },
              ),
              SizedBox(
                height: screen.height*0.08,
              ),
              Text(
                'Control de Servomotor 2',
                style: TextStyle(
                  fontSize: screen.width*0.045
                ),
              ),
              Slider(
                value: _rotacion2,
                min: 0,
                max: 180,
                divisions: 180,
                activeColor: const Color(0xFF256EDC),
                label: _rotacion2.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _rotacion2 = value;
                  });
                },
                onChangeEnd: (double value) {
                  _realtimeDatabase.actualizarMovimiento(_rotacion1, _rotacion2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
