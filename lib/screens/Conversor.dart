import 'package:flutter/material.dart';
import 'package:practica2/settings/color_settings.dart';

class Conversor extends StatefulWidget {
  Conversor({Key? key}) : super(key: key);

  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  double entrada = 0.0;
  double salida = 00.0;
  bool faCe = true;

  @override
  Widget build(BuildContext context) {
    Container btnCalcular = Container(
      child: RaisedButton(
        textColor: Colors.white,
        color: ColorApp.secondaryBackColorApp,
        child: Text('Covierte'),
        onPressed: () {
          setState(() {
            faCe == false
                ? salida = (entrada - 32) * (5 / 9)
                : salida = (entrada * 9 / 5) + 32;
          });
          AlertDialog dialog = AlertDialog(
            title: const Text('Conversion'),
            content: faCe == false
                ? Text(
                    "${entrada.toStringAsFixed(2)} °F -> ${salida.toStringAsFixed(2)} °C")
                : Text(
                    "${entrada.toStringAsFixed(2)} °C -> ${salida.toStringAsFixed(2)} °F"),
          );
          showDialog(builder: (context) => dialog, context: context);
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorApp.secondaryBackColorApp,
          title: Text('Conversor °C - °F')),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w300),
              keyboardType: TextInputType.number,
              onChanged: (str) {
                try {
                  entrada = double.parse(str);
                } catch (e) {
                  entrada = 0.0;
                }
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.blue, fontSize: 17.0),
                icon: Icon(Icons.thermostat, color: Colors.cyan),
                labelText:
                    'Valor en grados ${faCe == false ? "Fahrenheit" : "Celsius"}',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Grado a calcular'),
            SizedBox(
              height: 15,
            ),
            Text("Fahrenheit (°F)"),
            Radio<bool>(
                groupValue: faCe,
                value: false,
                onChanged: (v) {
                  setState(() {
                    faCe = v!;
                  });
                }),
            Text("Celsius (°C)"),
            Radio<bool>(
                groupValue: faCe,
                value: true,
                onChanged: (v) {
                  setState(() {
                    faCe = v!;
                  });
                }),
            btnCalcular,
          ],
        ),
      ),
    );
  }
}
