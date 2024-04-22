import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isFavoriteed = true;
  int _favoriteCount = 41;

  bool _isChecked = false;
  int _dropdownValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(0),
                child: IconButton(
                  icon: (_isFavoriteed
                      ? const Icon(Icons.star)
                      : const Icon(Icons.star_border)),
                  color: Colors.red[500],
                  onPressed: () {
                    setState(() {
                      if (_isFavoriteed) {
                        _favoriteCount -= 1;
                        _isFavoriteed = false;
                      } else {
                        _favoriteCount += 1;
                        _isFavoriteed = true;
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                width: 18,
                child: Container(
                  child: Text('$_favoriteCount'),
                ),
              ),
              Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  }),
              DropdownButton(
                  value: _dropdownValue,
                  items: [
                    DropdownMenuItem(child: Text("Item 1"), value: 1),
                    DropdownMenuItem(child: Text("Item 2"), value: 2),
                    DropdownMenuItem(child: Text("Item 3"), value: 3),
                  ],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _dropdownValue = value!;
                    });
                  })
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "hint text",
                
              ),
              keyboardType: TextInputType.name,
            ),
          ),
        ],
      ),
    ));
  }
}
