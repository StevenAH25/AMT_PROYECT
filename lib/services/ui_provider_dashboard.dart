import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{

  int _selectedMenu = 0;

  int get selectedMenu{
    return _selectedMenu;
  }

  set selectedMenu(int i){
    _selectedMenu = i;
    notifyListeners();
  }

}