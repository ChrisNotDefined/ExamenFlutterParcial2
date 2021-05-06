import 'dart:math';

import 'package:flutter/material.dart';

class FormulaPage extends StatefulWidget {
  const FormulaPage({Key key}) : super(key: key);

  @override
  _FormulaPageState createState() => _FormulaPageState();
}

class _Formula {
  double a = 0;
  double b = 0;
  double c = 0;

  double x1 = 0;
  double x2 = 0;

  void solve() {
    // raiz(b^2-4ac)
    double raiz = sqrt(pow(b, 2) - 4 * a * c);

    x1 = (-b + raiz) / (2 * a);
    x2 = (-b - raiz) / (2 * a);
  }

  String toMathNotation() {
    String notation = '';
    if (this.a.floorToDouble() == this.a && this.a != 0) {
      if (a < 0) {
        notation += '- ${this.a}x^2 ';
      } else {
        notation += '${this.a.floor()}x^2 ';
      }
    }
    if (this.b.floorToDouble() == this.b && this.b != 0) {
      if (a < 0) {
        notation += '- ${this.b}x ';
      } else {
        notation += '+ ${this.b.floor()}x ';
      }
    }
    if (this.c.floorToDouble() == this.c && this.c != 0) {
      if (a < 0) {
        notation += '- ${this.c}';
      } else {
        notation += '+ ${this.c.floor()}';
      }
    }

    if (notation == '') return 'Escriba en los campos';

    return notation;
  }
}

class _FormulaPageState extends State<FormulaPage> {
  _Formula _formule = _Formula();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        title: Text(
          'Fórmula Cuadrática',
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/imagen3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _displayFormula(),
            _formInput(
              hint: '0',
              label: 'Lado a',
              isNumber: true,
              onChange: (text) {
                if (text != '') {
                  setState(() {
                    _formule.a = double.parse(text);
                  });
                } else {
                  setState(() {
                    _formule.a = 0;
                  });
                }
              },
            ),
            _formInput(
              hint: '0',
              label: 'Lado b',
              isNumber: true,
              onChange: (text) {
                if (text != '') {
                  setState(() {
                    _formule.b = double.parse(text);
                  });
                } else {
                  setState(() {
                    _formule.b = 0;
                  });
                }
              },
            ),
            _formInput(
              label: 'Lado c',
              isNumber: true,
              hint: '0',
              onChange: (text) {
                if (text != '') {
                  setState(() {
                    _formule.c = double.parse(text);
                  });
                } else {
                  setState(() {
                    _formule.c = 0;
                  });
                }
              },
            ),
            _results(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _formule.solve();
                });
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber)),
              child: Text('Calcular'),
            )
          ],
        ),
      ),
    );
  }

  Widget _displayFormula() {
    return Center(
      child: Text('${_formule.toMathNotation()}'),
    );
  }

  Widget _formInput(
      {@required String label,
      @required void Function(String) onChange,
      bool isNumber = false,
      String hint}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, hintText: hint),
      onChanged: onChange,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    );
  }

  Widget _results() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Text('x1: ${_formule.x1}'), Text('x2: ${_formule.x2}')],
      ),
    );
  }
}
