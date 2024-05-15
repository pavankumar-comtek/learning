import 'package:flutter/material.dart';
import 'package:learning/models/volume_response.dart';
import 'package:learning/providers/example2_provider.dart';
import 'package:learning/providers/example_provider.dart';
import 'package:provider/provider.dart';

class ExampleProviderScreen extends StatefulWidget {
  const ExampleProviderScreen({super.key});

  @override
  State<ExampleProviderScreen> createState() => _ExampleProviderScreenState();
}

class _ExampleProviderScreenState extends State<ExampleProviderScreen> {
  
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ExampleProvider>(context, listen: false).getBookList();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Provider"),
      ),

      //ChangeNotifierProvider is parent widget that provides access to the data and logic of the ChangeNotifier class.
      body:  Center(
          child: Consumer<ExampleProvider>(builder: (context, provider, child) {
            return SingleChildScrollView(
              child: provider.volumeResponse == null
                  ? CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(provider
                            .volumeResponse!.items![0].volumeInfo!.title!),

                            Consumer<ExampleProvider2>(
                              builder: (context, provider2, child) {
                                return Text(provider2.counter.toString());
                              },
                            )
                      ],
                    ),
            );
          }),
        ),
      
    );
  }
}
