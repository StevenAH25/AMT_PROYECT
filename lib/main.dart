import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spt_app/helpers/routes.dart';
import 'package:spt_app/services/notification_services.dart';
import 'package:spt_app/services/ui_provider_dashboard.dart';
import 'package:spt_app/views/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  
  await NotificationService.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(        
      providers: [ChangeNotifierProvider(create: (_)=>UiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: StartScreen.routname,
        routes: AppRoutes.routes(),
      ),
    );
  }
}
