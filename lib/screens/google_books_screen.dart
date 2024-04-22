import 'package:flutter/material.dart';
import 'package:learning/models/volume_response.dart';
import 'package:learning/repository/api.dart';

class GoogleBooksScreen extends StatefulWidget {
  const GoogleBooksScreen({super.key});

  @override
  State<GoogleBooksScreen> createState() => _GoogleBooksScreenState();
}

class _GoogleBooksScreenState extends State<GoogleBooksScreen> {
  final bookApi2 = BookApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Books"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<VolumeResponse>(
            future: bookApi2.getBooks(),
            builder:
                (BuildContext context, AsyncSnapshot<VolumeResponse> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Container(
                  height: 300,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.items.length,
                      itemBuilder: (context, index) {
                        Item items = snapshot.data!.items.elementAt(index);
                        return ListTile(
                          tileColor: Colors.yellowAccent,
                          title: Text(items.volumeInfo.title),
                          subtitle: Text(items.volumeInfo.authors.toString()),
                          leading: Image.network(
                              items.volumeInfo.imageLinks.thumbnail),
                        );
                      }),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
