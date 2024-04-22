import 'package:flutter/material.dart';
import 'package:learning/providers/example_provider.dart';
import 'package:provider/provider.dart';

class ExampleProviderScreen extends StatefulWidget {
  const ExampleProviderScreen({super.key});

  @override
  State<ExampleProviderScreen> createState() => _ExampleProviderScreenState();
}

class _ExampleProviderScreenState extends State<ExampleProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Provider"),
      ),

      //ChangeNotifierProvider is parent widget that provides access to the data and logic of the ChangeNotifier class.
      body: ChangeNotifierProvider(
        create: (context) => ExampleProvider(),
        //Consumer is child which has access to properties of its parent widget.
        child: Center(
          child: Consumer<ExampleProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${provider.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        provider.incrementCounter();
                      },
                      child: const Text("Increment"))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
