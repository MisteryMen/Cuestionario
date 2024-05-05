import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class preguntas extends StatefulWidget {
  const preguntas({Key? key}) : super(key: key);

  @override
  _preguntasState createState() => _preguntasState();
}

class _preguntasState extends State<preguntas> {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: "Cuestionario",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondo.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Stack(children: [
              Image.asset(
                'assets/vineta.png',
              ),
              Positioned(
                top: 100,
                child: Container(
                  //padding: EdgeInsets.symmetric(vertical: 120, horizontal: 20),
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Text(
                    'Prueba clases',
                    style: TextStyle(
                        color: Colors.cyan, fontSize: 36, fontFamily: 'rlight'),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
