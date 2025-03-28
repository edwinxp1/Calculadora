import 'package:flutter/material.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _temp = '';
  String _operation = '';
  // Función que maneja las acciones de los botones de la calculadora
  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _output = '0';
        _temp = '';
        _operation = '';
      } else if (value == 'CE') {
        _output = _output.length > 1 ? _output.substring(0, _output.length - 1) : '0';
      } else if (['+', '-', '*', '/', '%'].contains(value)) {
        _temp = _output;
        _operation = value;
        _output = '';
      } else if (value == '=') {
        double num1 = double.parse(_temp);
        double num2 = double.parse(_output);

        // Evalua si la operación fue seleccionada y cálcula el resultado
        switch (_operation) {
          case '+':
            _output = (num1 + num2).toString();
            break;
          case '-':
            _output = (num1 - num2).toString();
            break;
          case '*':
            _output = (num1 * num2).toString();
            break;
          case '/':
            _output = (num2 != 0) ? (num1 / num2).toString() : 'Error';
            break;
          case '%':
            _output = (num1 % num2).toString();
            break;
        }
      } else {
        _output = _output == '0' ? value : _output + value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculador'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, '/developer-info');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Contenedor que muestra el resultado actual.
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                _output,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Divider(),
          _buildButtons(),
        ],
      ),
    );
  }
  // Metodo que construye el diseño de los botones y en forma de lista
  Widget _buildButtons() {
    List<List<String>> buttons = [
      ['C', 'CE', '%', '/'],
      ['7', '8', '9', '*'],
      ['4', '5', '6', '-'],
      ['1', '2', '3', '+'],
      ['0', '.', '=', ],
    ];

    return Column(
      children: buttons
          .map(
            (row) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: row
                  .map(
                    (btn) => CalculatorButton(
                      text: btn,
                      onTap: btn.isNotEmpty ? () => _onPressed(btn) : null,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}
