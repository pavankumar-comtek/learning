import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning/streams/counter_stream.dart';

class StreamLearning extends StatefulWidget {
  const StreamLearning({super.key});

  @override
  State<StreamLearning> createState() => _StreamLearningState();
}

class _StreamLearningState extends State<StreamLearning> {
  final counterStream = CounterStream();
  @override
  Widget build(BuildContext context) {
    //If it is calling from setState
    log("Printed from SetState()");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Learning'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: counterStream.streamController.stream,
              builder: (context, snapshot) {
                return Text('You hit me: ${snapshot.data} times');
              },
            ),

            //Text of my name
            Text('You hit Not Stream Builder me: ${counterStream.count} times'),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                // Navigator.pushNamed(context, '/second');
                counterStream.addNumberToSink(1);
                //setState(() {});
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
