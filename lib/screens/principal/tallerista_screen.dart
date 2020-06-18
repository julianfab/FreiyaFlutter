import 'package:flutter/material.dart';
import 'package:freiyaflutter/screens/principal/widgets/body.dart';
import 'package:freiyaflutter/screens/principal/widgets/header.dart';

class TalleristaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: Header(tallerista: true,),
        body: Body(tallerista: true,),
      )
    );
  }
}