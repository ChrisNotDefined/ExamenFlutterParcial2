import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  NamePage({Key key}) : super(key: key);

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  String _name = "";
  String _sortedName = "";
  bool changed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            'Descomposicion',
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
              TextFormField(
                decoration: const InputDecoration(labelText: "Nombre"),
                onChanged: (changeName) {
                  setState(() {
                    _name = changeName;
                    changed = true;
                  });
                },
              ),
              Text(_sortedName),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber)),
                onPressed: changeName,
                child: Text("Ordenar"),
              )
            ],
          ),
        ));
  }

  void changeName() {
    if (changed == true) {
      setState(() {
        _sortedName = "";
        List<String> characters = <String>[''];
        List<int> runes = [];
        _name.runes.forEach((int rune) {
          String character = new String.fromCharCode(rune);
          if (characters[0] == '') {
            characters[0] = character;
          } else {
            characters.add(character);
          }

          runes.add(rune);
          print('$character, $rune');
        });

        for (int i = 0; i < runes.length; i++) {
          for (int j = 0; j < runes.length - 1; j++) {
            int relativej = runes[j] < 97 ? runes[j] + 32 : runes[j];
            int relativejp1 =
                runes[j + 1] < 97 ? runes[j + 1] + 32 : runes[j + 1];

            if (relativej > relativejp1) {
              int newNum = runes[j];
              runes[j] = runes[j + 1];
              runes[j + 1] = newNum;
            }
          }
        }

        _sortedName = String.fromCharCodes(runes);
      });
    }
  }
}
