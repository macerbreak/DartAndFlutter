import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DevicePage.dart';

class DevicesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  // List<Widget> _devises = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return _getDevice(index);
      },
    );
  }

  Widget _getDevice(int deviceNumber) {
    return Card(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DevicePage()),
          );
        },
        child: ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Device $deviceNumber'),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
    );
  }
}
