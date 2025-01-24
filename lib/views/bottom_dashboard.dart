import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spt_app/custom/custom_navigaton_bar.dart';
import 'package:spt_app/services/ui_provider_dashboard.dart';
import 'package:spt_app/views/alerts.dart';
import 'package:spt_app/views/control.dart';
import 'package:spt_app/views/home_page.dart';
import 'package:spt_app/views/profile.dart';
import 'package:spt_app/views/record.dart';

class BottomDashboard extends StatelessWidget {
  static const String routname = '/dashboard';
  const BottomDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _InitialBody(),
      bottomNavigationBar: CustomNavigatorBar(),
    );
  }
}

class _InitialBody extends StatelessWidget {
  // ignore: unused_element
  const _InitialBody({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProviderSelected = Provider.of<UiProvider>(context);
    final currentIndex = uiProviderSelected.selectedMenu;

    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const Record();
      case 2:
        return const Control();
      case 3: 
        return const Alerts();
      case 4: 
        return const Profile();
      default:
        return const HomePage();
    }
    
  }
}