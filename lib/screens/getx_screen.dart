import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/controllers/example_controller.dart';

class LearnGetx extends GetView<ExampleController> {
  const LearnGetx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text('Counter: ${controller.count}')),
            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
