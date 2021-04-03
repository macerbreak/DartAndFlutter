import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemperaturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  bool _isConnected = false;

  @override
  Widget build(BuildContext context) {
    return !_isConnected
        ? Center(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _isConnected = true;
                });
              },
              child: Text(
                'Measure the ambient temperature',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith(
                        (states) => Size(230, 130),
                  ),
            ),
          ),
    )
        : Stack(
            children: [
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Text(
                  'Ambient temperature is',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.blue[600]),
                ),
              ),
              Center(
                child: Text(
                  '27ºC',
                  style: TextStyle(fontSize: 100, color: Colors.blue[800]),
                ),
              )
            ],
          );
  }
}
