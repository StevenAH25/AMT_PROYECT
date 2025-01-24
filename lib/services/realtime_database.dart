import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabase {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  Stream<Map<String, dynamic>> getCargaStream() {
    return _databaseReference.child('estadoCarga').onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?; // Asegúrate de que obtienes el mapa correctamente
      return {
        'carga': data?['carga'] ?? 0, // Si es null, devuelve 0
        'tiempo': data?['tiempo'] ?? 'Desconocido', // Si es null, devuelve un string por defecto
      };
    });
  }

  Future<void> actualizarMovimiento(double rotacion1, double rotacion2) async {
    await _databaseReference.child('movimiento').set({
      'rotacion1': rotacion1.toInt(),
      'rotacion2': rotacion2.toInt(),
    });
  }

}