import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:learning/models/pizza_model.dart';
import 'package:learning/repository/api.dart';

class BookDataScreen extends StatefulWidget {
  const BookDataScreen({super.key});

  @override
  State<BookDataScreen> createState() => _BookDataScreenState();
}

class _BookDataScreenState extends State<BookDataScreen> {
  final bookApi = BookApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Data'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<List<PizzaModel>>(
              future: bookApi.loadBookAsset(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Container(
                    height: 300,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          PizzaModel pizza = snapshot.data!.elementAt(index);
                          return ListTile(
                            title: Text(pizza.pizzaName),
                            subtitle: Text(pizza.description),
                            leading: Text(pizza.price.toString()),
                          );
                        }),
                  );
                }
              }),
        ),
      ),
    );
  }
}
