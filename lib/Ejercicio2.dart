import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicio 2")),
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/im1.jpg"),
           
          ),
        ),
        child: formulario(context),
      ),
    );
  }
}
Widget formulario(context) {
  TextEditingController salario = TextEditingController();
  TextEditingController pais = TextEditingController();

  return Column(
    children: [
      TextField(
        controller: salario,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Ingresar el salario",
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: pais,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Ingresar el país",
        ),
      ),
      const SizedBox(height: 20),
      OutlinedButton(
        onPressed: () => calcular(salario, pais, context),
        child: const Text("Calcular"),
      ),
    ],
  );
}

void calcular( _salario, _pais, context) {
  double salario = double.parse(_salario.text);
  String pais = _pais.text.toLowerCase();

  double imp = 0;
  String msj = "";

  if (pais == "españa") {
    imp = 0.21;
  } else if (pais == "mexico") {
    imp = 0.30;
  } else if (pais == "argentina") {
    imp = 0.35;
  } else if (pais == "colombia") {
    imp = 0.19;
  } else {
    msj = "El país no es válido";
  }

  if (msj == "") {
    double des = salario * imp;
    double neto = salario - des;

    msj =
        "Salario Neto: \$${neto.toStringAsFixed(2)}\n"
        "Impuestos: \$${des.toStringAsFixed(2)}";
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Resultado"),
        content: Text(msj),
      );
    },
  );
}

