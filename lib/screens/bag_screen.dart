import 'package:flutter/material.dart';
import 'package:learning/models/product_model.dart';
import 'package:learning/providers/bag_provider.dart';
import 'package:provider/provider.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Consumer<BagProvider>(builder: (context, provider, child) {
        if (provider.products.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            shrinkWrap: true,
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.products[index].productName),
                subtitle:
                    Text(provider.products[index].productPrice.toString()),
                trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    provider.addProductToBag(provider.products[index]);
                  },
                ),
                leading: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    provider.removeProductFromBag(provider.products[index]);
                  },
                ),
              );
            });
      }),
      bottomNavigationBar:
          Consumer<BagProvider>(builder: (context, provider, child) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                label: "count",
                icon: Text(
                    "${provider.productCount}  ${provider.totalAmount.toStringAsFixed(2)}"))
          ],
        );
      }),
    );
  }
}
