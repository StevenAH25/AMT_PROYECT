import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spt_app/services/ui_provider_dashboard.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenu;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenu = i,
      currentIndex: currentIndex,
      elevation: 20.0,
      iconSize: 30,
      selectedItemColor: const Color(0xff87cefa),
      unselectedItemColor: const Color(0xFF256EDC),
      showSelectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined),label: "Historial"),
        BottomNavigationBarItem(icon: Icon(Icons.control_camera),label: "Control"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_active),label: "Alertas"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Perfil")
      ],
    );
  }
}