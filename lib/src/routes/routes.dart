import 'package:examen_p2/src/pages/buttons_page.dart';
import 'package:examen_p2/src/pages/formula_page.dart';
import 'package:examen_p2/src/pages/main_page.dart';
import 'package:examen_p2/src/pages/name_page.dart';
import 'package:examen_p2/src/pages/numbers_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => MainPage(),
    'formula': (BuildContext context) => FormulaPage(),
    'buttons': (BuildContext context) => ButtonsPage(),
    'name': (BuildContext context) => NamePage(),
    'numbers': (BuildContext context) => NumbersPage()
  };
}
