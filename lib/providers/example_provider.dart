
import 'package:flutter/material.dart';

///ChangeNotifier
///It indicates a class that can used for writing business logic and manage data using provider.
///ChangeNotifierProvider
///It creates an instance of specified ChangeNotifier Class to provider access to its data and logic.
///Consumer
///It is a widget that listens to the changes in the ChangeNotifier class and rebuilds the widget tree when the data changes.


class ExampleProvider extends ChangeNotifier{
  int counter = 0;

  void incrementCounter(){
    counter++;
    //Similar to setState() in Stateful widget but it only updated the widget which is listening.
    notifyListeners();
  }
}