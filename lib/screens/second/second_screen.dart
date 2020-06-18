import 'package:flutter/material.dart';
import 'package:freiyaflutter/screens/second/widgets/sub_body.dart';
import 'package:freiyaflutter/screens/second/widgets/sub_header.dart';


class SecondScreen extends StatelessWidget {
  static const Map<int,String> mapFunctions = {
    0: 'Crear',
    1: 'Usar',
    2: 'Revisar',
    3: 'Unirse'
  };

  final int _id;

  Map<int, String> getMapFunction(int functionIn){
    return {functionIn : mapFunctions[functionIn]};
  }

  String getNameFunction(int id){
    return mapFunctions[id];
  }

  

  const SecondScreen({Key key, int idIn})
    :assert(idIn != null && 0<= idIn && idIn <= 3),
    _id = idIn,
    super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SubHeader(title: getNameFunction(_id),),
        body: SubBody(nameFunciton: getNameFunction(_id),),        
      ),
    );
  }
}