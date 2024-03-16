import 'dart:async';

import 'package:flutter/material.dart';


class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  int _seconds = 0;
  bool _isRunning = false;
  late Timer _timer;


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_seconds seconds',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isRunning ? null : _startStopwatch,
                  child: Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _startStopwatch() {
    setState(() {
      _isRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          _seconds++;
        });
      });
    });
  }

  void _resetStopwatch() {
    setState(() {
      _isRunning = false;
      _timer.cancel();
      _seconds = 0;
    });
  }
}
