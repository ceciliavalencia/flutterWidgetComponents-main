import 'package:flutter/material.dart';

import 'package:clase_3/src/pages/alert_page.dart';
import 'package:clase_3/src/pages/avatar_page.dart';
import 'package:clase_3/src/pages/home_page.dart';
import 'package:clase_3/src/pages/card_page.dart';
import 'package:clase_3/src/pages/animated_container.dart';
import 'package:clase_3/src/pages/input_page.dart';
import 'package:clase_3/src/pages/slider_page.dart';
import 'package:clase_3/src/pages/listview_page.dart';
import 'package:clase_3/src/pages/opacity_page.dart';
import 'package:clase_3/src/pages/table_page.dart';
import 'package:clase_3/src/pages/form_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    AvatarPage.pageName: (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage(),
    'opacity': (BuildContext context) => OpacityPage(),
    'table': (BuildContext context) => TablePage(),
    'form': (BuildContext context) => InputPageMascota()
  };
}
