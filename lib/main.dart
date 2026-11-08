
import 'package:flutter/material.dart';
import 'package:uts_2428240072/screens/detail_screen.dart';
import 'package:uts_2428240072/data/gado_gado_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuliner Jakarta',
      home: DetailScreen(
        modelGadoGado: gadoGadoList[0],
      ),
    );
  }
}
