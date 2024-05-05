import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: "Cuestionario",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondo.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                //pregunta
                Positioned(
                  top: 500.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25, bottom: 50),
                      child: Container(
                        height: 100,
                        width: 800,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black54),
                          color: Colors.white,
                        ),
                        child: Text(
                          "        When the Night is Over",
                          style: GoogleFonts.lora(
                            fontSize: 50,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 50.0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 80,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 50.0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 80,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 50.0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 80,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 50.0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 80,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
