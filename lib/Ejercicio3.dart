import 'package:flutter/material.dart';

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicio 3")),
      body: formulario(context),
    );
  }
}

Widget formulario(context) {
  TextEditingController vinicial = TextEditingController();
  TextEditingController vfinal = TextEditingController();
  TextEditingController tiempo = TextEditingController();

  return Column(
    children: [
      TextField(
        controller: vinicial,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Ingresar velocidad inicial",
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: vfinal,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Ingresar velocidad final",
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: tiempo,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Ingresar el tiempo",
        ),
      ),
      const SizedBox(height: 20),
      OutlinedButton(
        onPressed: () => calcular(vinicial, vfinal, tiempo, context),
        child: const Text("Calcular"),
      ),
    ],
  );
}

void calcular(_vinicial, _vfinal, _tiempo, context) {
  double vi = double.parse(_vinicial.text);
  double vf = double.parse(_vfinal.text);
  double t = double.parse(_tiempo.text);

  String msj = "";

  if (t == 0) {
    msj = "Error: el tiempo debe ser mayor a 0.";
  } else {
    double a = (vf - vi) / t;
    msj = "La aceleración es: ${a.toStringAsFixed(2)}";
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Resultado"),
       content: Text(msj));
    },
  );
}
