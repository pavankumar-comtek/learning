import 'dart:async';
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

  StreamTransformer<int, int> streamTransformer =
      StreamTransformer<int, int>.fromHandlers(
    handleData: (data, sink) {
      sink.add(data * 2);
    },
    handleError: (error, stackTrace, sink) {
      sink.addError("Error: $error");
    },
    handleDone: (sink) {
      sink.close();
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counterStream.streamController.stream.listen((event) {
      log("Printed from StreamController");
    });

    counterStream.streamController.stream.listen((event) {
      log("Printed from StreamController 2");
    });

    counterStream.streamController.stream
        .transform(streamTransformer)
        .listen((event) {
      log("Printed from StreamTransformer $event");
      log("Count is ${counterStream.count}");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    counterStream.close();
    super.dispose();
  }

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
              stream: counterStream.streamController.stream
                  .transform(streamTransformer),
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
