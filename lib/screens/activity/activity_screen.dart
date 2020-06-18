import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  final String _activity;

  ActivityScreen({Key key, String activity})
    : assert(activity!=null),
    _activity =activity,
    super(key: key);
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    Widget screen;
    switch (widget._activity) {
      case 'Preguntas':
        screen = Container();
        break;
      default:
    }
    return screen;
  }
}