import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LightPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
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
                'Measure the ambient lightning',
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
                  'Ambient lighting is',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.blue[600]),
                ),
              ),
              Center(
                child: Text(
                  '10 lux',
                  style: TextStyle(fontSize: 100, color: Colors.blue[800]),
                ),
              )
            ],
          );
  }
}
