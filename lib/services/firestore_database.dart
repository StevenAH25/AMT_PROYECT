import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spt_app/services/realtime_database.dart';

class FirestoreDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final RealtimeDatabase _databaseReference;

  FirestoreDatabase(RealtimeDatabase databaseReference) {
    _databaseReference = databaseReference;
  }

  Future<void> setDataFireStore(int carga, String tiempo) async {
    if (tiempo.isEmpty || carga == 0) {
      print('Datos inválidos, no se puede almacenar en Firestore');
      return;
    }

    try {
      // Convertir el tiempo a DateTime
      DateTime dateTime = DateTime.parse(tiempo);

      // Formatear la fecha y hora
      String fecha = '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
      String hora = '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';

      // Referencia al documento de la fecha
      final DocumentReference ref = _firestore.collection('registro_carga').doc(fecha);

      // Actualizar Firestore con la hora y la carga
      await ref.set({
        'registro': {
          hora: carga, // Almacenar la carga bajo la hora correspondiente
        }
      }, SetOptions(merge: true));

      print('Datos almacenados correctamente en Firestore');
    } catch (e) {
      print('Error al almacenar en Firestore: $e');
    }
  }

  void getAndSetData() {
    _databaseReference.getCargaStream().listen((data) {
      final int carga = data['carga'] ?? 0;
      final String tiempo = data['tiempo'] ?? '';

      // Almacenar los datos en Firestore
      setDataFireStore(carga, tiempo);
    });
  }
}


