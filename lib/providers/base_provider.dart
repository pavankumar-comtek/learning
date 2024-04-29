import 'package:flutter/material.dart';
import 'package:learning/repository/api.dart';

class BaseProvider extends ChangeNotifier{
   final bookApi = BookApi();
}