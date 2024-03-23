import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:learning/models/pizza_model.dart';
import 'package:learning/models/volume_response.dart';

class BookApi {
  //GET, POST, PUT, DELETE

  //GET means to retrieve data from the server
  // Downloading a file from the server

  //POST means to send data to the server
  // Uploading a file to the server

  //PUT means to update data on the server
  // Updating a file on the server

  //DELETE means to remove data from the server
  // Deleting a file from the server

  Future<VolumeResponse> getBooks() async {
    Response response = await get(Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=isbn:0747532699'));
    log(response.body);
    return VolumeResponse.fromJson(jsonDecode(response.body));
  }

  //Write function to read json file from assets
  Future<List<PizzaModel>> loadBookAsset() async {
    try {
      String jsonString = await rootBundle.loadString('assets/pizzalist.json');
      print(jsonString);
      return pizzaModelFromJson(jsonString);
    } catch (e) {
      return [];
    }
  }
}
