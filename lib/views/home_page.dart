import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:spt_app/services/firestore_database.dart';
import 'package:spt_app/services/notification_services.dart';
import 'package:spt_app/services/realtime_database.dart';

class HomePage extends StatefulWidget {
  static const String routname = '/homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RealtimeDatabase _realtimeDatabase = RealtimeDatabase();
  late final FirestoreDatabase _firestoreDatabase;
  Map<String, dynamic> _data = {'carga': 0, 'tiempo': ''};

  @override
  void initState() {
    super.initState();
    _firestoreDatabase = FirestoreDatabase(_realtimeDatabase);
    _realtimeDatabase.getCargaStream().listen((data) {
      setState(() {
        _data = data;
      });

      final int carga = data['carga'] ?? 0.0;
      final String tiempo = data['tiempo'] ?? '';
      _firestoreDatabase.setDataFireStore(carga, tiempo);
    });
  }


  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: screen.height*0.2,
              width: screen.width*0.5,
            ),
            Text(
              "¡Bienvenido!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screen.width*0.06
              )
            ),
            Text(
              "Registro en Tiempo Real",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screen.width*0.06
              )
            ),
            SizedBox(
              height: screen.height*0.1
            ),
            _buildShowTime(),
            SizedBox(
              height: screen.height*0.05
            ),
            _buildCircularBatteryIndicator(),
            SizedBox(
              height: screen.height*0.05
            ),
           ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF256EDC),
                  minimumSize: Size(screen.width*0.6, screen.height*0.045)
                ),
                onPressed: (){
                  final int carga = _data['carga'] ?? 0.0;
                  final String tiempo = _data['tiempo'] ?? '';
                  _firestoreDatabase.setDataFireStore(carga, tiempo);
                  if (carga>95){
                    NotificationService.mostrarNotifiacion('¡Carga Lista!', 'La carga de la batería está próxima a completarse');
                  } else if (carga <10){
                    NotificationService.mostrarNotifiacion('¡Falta Carga!', '¡Es momento de cargar la batería!');
                  }
                }, 
                child: Text(
                  "Registrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screen.width*0.05
                  )
                )
              )
          ],
        ),
      ),
    );
  }

  Widget _buildCircularBatteryIndicator() {
    double carga = _data['carga']?.toDouble() ?? 0;
    double porcentaje = carga / 100;
    final screen = MediaQuery.of(context).size;

    return CircularPercentIndicator(
      radius: 130.0,
      lineWidth: screen.width*0.04,
      animation: true,
      percent: porcentaje,
      center: Text(
        "Carga: ${carga.toStringAsFixed(1)}%",
        style: TextStyle(
          fontSize: screen.width*0.05
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: _getBatteryColor(carga),
      backgroundColor: Colors.grey[300]!,
    );
  }

  Color _getBatteryColor(double carga) {
    if (carga > 75) {
      return Colors.blue.shade800;
    } else if (carga > 50) {
      return Colors.blue.shade600;
    } else if (carga > 25) {
      return Colors.blue.shade400;
    } else {
      return Colors.blue.shade200;
    }
  }

  Widget _buildShowTime(){
    final screen = MediaQuery.of(context).size;
    String tiempo = _data['tiempo'];
    DateTime dateTime = DateTime.parse(tiempo);

    String fecha = '${dateTime.day}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year.toString().padLeft(2, '0')}';
    String hora = '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';

    return Column(
      children: [
        Text(
          'Fecha: $fecha', 
          style: TextStyle(
          fontSize: screen.width*0.05
          ),
        ),
        Text(
          'Hora: $hora', 
          style: TextStyle(
          fontSize: screen.width*0.05
        ),
        ),
      ],
    );
  }
}