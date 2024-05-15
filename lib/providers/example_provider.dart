import 'package:flutter/material.dart';
import 'package:learning/models/pizza_model.dart';
import 'package:learning/models/volume_response.dart';
import 'package:learning/providers/base_provider.dart';
import 'package:learning/repository/api.dart';

///ChangeNotifier
///It indicates a class that can used for writing business logic and manage data using provider.
///ChangeNotifierProvider
///It creates an instance of specified ChangeNotifier Class to provider access to its data and logic.
///Consumer
///It is a widget that listens to the changes in the ChangeNotifier class and rebuilds the widget tree when the data changes.

class ExampleProvider extends BaseProvider {
  // ExampleProvider() {
  //   //This is the constructor of the class which is called when the class is initialized.
  //   //getBookList();
 // }
  int counter = 0;
  VolumeResponse? volumeResponse;

  void incrementCounter() {
    counter++;
    //Similar to setState() in Stateful widget but it only updated the widget which is listening.
    notifyListeners();
  }

  void getBookList() async {
    try {
      //The expected functionality like calling API or any asynchronous calls.
      volumeResponse = await bookApi.getBooks();
      notifyListeners();
      //throw Exception('Error');
    } catch (e) {
      print(e);
    }
  }
}
