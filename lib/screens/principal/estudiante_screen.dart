import 'package:flutter/material.dart';
import 'package:freiyaflutter/screens/principal/widgets/body.dart';
import 'package:freiyaflutter/screens/principal/widgets/header.dart';

class EstudianteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: Header(tallerista: false,),
        body: Body(tallerista: false,),
      )
    );
  }
}