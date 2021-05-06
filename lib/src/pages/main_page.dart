import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _name = '';
  String _edad = '';
  String _estado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        title: Text(
          'Examen Segundo Parcial',
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
          children: [
            _formInput(
              label: 'Nombre',
              onChange: (newval) {
                setState(() {
                  _name = newval;
                });
              },
            ),
            Divider(height: 10.0),
            _formInput(
              label: 'Edad',
              isNumber: true,
              onChange: (newval) {
                _edad = newval;
              },
            ),
            Divider(height: 10.0),
            _formInput(
              label: 'Estado',
              onChange: (newval) {
                _estado = newval;
              },
            ),
            Divider(height: 10.0),
            Expanded(
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber)),
                    child: Text('Iniciar'),
                    onPressed: _validarEntrada,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formInput(
      {@required String label,
      @required void Function(String) onChange,
      bool isNumber = false}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      onChanged: onChange,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    );
  }

  void _validarEntrada() {
    if (_name != '' && _edad != '' && _estado != '') {
      Navigator.pushNamed(context, 'buttons',
          arguments: {'name': _name, 'age': _edad, 'state': _estado});
      return;
    }
  }
}
