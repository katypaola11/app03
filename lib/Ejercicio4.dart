import 'package:flutter/material.dart';

class Ejercicio4 extends StatelessWidget {
  const Ejercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicio 4")),
      body: formulario(context),
    );
  }
}

Widget formulario(context) {
  TextEditingController masa = TextEditingController();
  TextEditingController velocidad = TextEditingController();

  return Column(
    children: [
      TextField(
        controller: masa,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Ingresar la masa",
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: velocidad,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Ingresar la velocidad",
        ),
      ),
      const SizedBox(height: 20),
      OutlinedButton(
        onPressed: () => calcular(masa, velocidad, context),
        child: const Text("Calcular"),
      ),
    ],
  );
}

void calcular(_masa, _velocidad, context) {
  double m = double.tryParse(_masa.text) ?? 0;
  double v = double.tryParse(_velocidad.text) ?? 0;

  String msj = "";

  if (v == 0) {
    msj = "El objeto está en reposo (energía = 0)";
  } else {
    double ec = 0.5 * m * v * v;
    msj = "La energía  es: ${ec.toStringAsFixed(2)}";
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
