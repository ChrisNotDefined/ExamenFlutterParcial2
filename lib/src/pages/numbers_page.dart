import 'dart:math';

import 'package:flutter/material.dart';

class NumbersPage extends StatefulWidget {
  NumbersPage({Key key}) : super(key: key);

  @override
  _NumbersPageState createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  String _randomNumber = "";
  double _minLimit = 0.0;
  double _maxLimit = 0.0;
  bool changed1 = false;
  bool changed2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "Numeros Aleatorios",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/imagen3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(_randomNumber),
              TextFormField(
                decoration: const InputDecoration(labelText: "Inicio"),
                keyboardType: TextInputType.number,
                onChanged: (newMinLimit) {
                  setState(() {
                    if (newMinLimit != null && newMinLimit != "") {
                      _minLimit = double.parse(newMinLimit);
                      changed1 = true;
                    }
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Fin"),
                keyboardType: TextInputType.number,
                onChanged: (newMaxLimit) {
                  setState(() {
                    if (newMaxLimit != null && newMaxLimit != "") {
                      _maxLimit = double.parse(newMaxLimit);
                      changed2 = true;
                    }
                  });
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber)),
                onPressed: getRandomNumber,
                child: Text("Generar Random"),
              )
            ],
          ),
        ));
  }

  void getRandomNumber() {
    final random = Random();
    if (changed1 != false && changed2 != false && _maxLimit > _minLimit) {
      setState(() {
        int a = (_maxLimit - _minLimit).toInt();
        double r = _minLimit + random.nextInt(a + 1);
        _randomNumber = r.toString();
      });
    }
  }
}
