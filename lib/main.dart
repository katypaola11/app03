import 'package:examen1/Ejercicio1.dart';
import 'package:examen1/Ejercicio2.dart';
import 'package:examen1/Ejercicio3.dart';
import 'package:examen1/Ejercicio4.dart';
import 'package:examen1/Ejercicio5.dart';
import 'package:flutter/material.dart';

void main (){
  runApp( Aplicacion06V2());
}

 class Aplicacion06V2 extends StatefulWidget {
  const Aplicacion06V2({super.key});

  @override
  State<Aplicacion06V2> createState() => _Aplicacion06V2State();
}

class _Aplicacion06V2State extends State<Aplicacion06V2> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Cuerpo(),

    );
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo ({super.key});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  int indice = 0;

  List<Widget> paginas = [Ejercicio1(), Ejercicio2(), Ejercicio3(), Ejercicio4(), Ejercicio5()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vista Principal")),
      body: paginas[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (value) => setState(() {
          indice = value;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Ejer 1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.e_mobiledata), label: "Ejer 2"),
          BottomNavigationBarItem(
              icon: Icon(Icons.e_mobiledata), label: "Ejer 3"),
          BottomNavigationBarItem(
              icon: Icon(Icons.e_mobiledata), label: "Ejer 4"),
          BottomNavigationBarItem(
              icon: Icon(Icons.e_mobiledata), label: "Ejer 5"),
        ],
      ),
    );
  }
}


