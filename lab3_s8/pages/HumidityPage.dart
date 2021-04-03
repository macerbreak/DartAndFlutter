import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HumidityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HumidityPageState();
}

class _HumidityPageState extends State<HumidityPage> {
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
                'Measure the ambient humidity',
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
                  'Ambient humidity is',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.blue[600]),
                ),
              ),
              Center(
                child: Text(
                  '80%',
                  style: TextStyle(fontSize: 100, color: Colors.blue[800]),
                ),
              )
            ],
          );
  }
}
