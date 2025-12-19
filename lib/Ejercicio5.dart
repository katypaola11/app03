import 'dart:convert';

import 'package:flutter/material.dart';

class Ejercicio5 extends StatelessWidget {
  const Ejercicio5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicio 5")),
      body: Listar(context),
    );
  }
}

Future<List> leerLista(context) async {
  final jsonString = await DefaultAssetBundle.of(
    context,
  ).loadString("assets/data/peliculas3.json");

  return json.decode(jsonString)['peliculas'];
}

Widget Listar(context){
  return FutureBuilder(future: leerLista(context),builder: (context, snapshot) {
    if (snapshot.hasData){
      List data=snapshot.data!;

      return ListView.builder(itemCount:data.length , itemBuilder:(context, index) {
        final item=data[index];
        return ListTile(
          title: Text(item['titulo']),
          subtitle: Column(
            children: [
              Text("Género: ${item['genero'][0]}"),
              Image.network(item['imagen'])
            ],
          ),
        );
      },);
    }else {
      return Text("No hay Texto");
    }
  },);
}