import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning/screens/favourite_page.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late int count;
  final int maxCount = 1;
  late Timer timer;
  //initState()
  //It is used to initialize any non final values.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 10;
    //Cant use context here
    print(context.mounted);
    print("initState");
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(timer.tick);
      setState(() {
        //It will refresh the entire screen.
        count++;
      });
    });
  }

  //1st second  count = 0, count will be updated to 1
  //2nd second  count = 1, count will be updated to 2

  //didChangeDependencies()
  //It is called immediately after initState on the first time the widget is built.

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print("didChangeDependencies");
  }

  //didUpdateWidget()

  //dispose()
  //It is called when the state object is removed from the tree.



// Provider
// Bloc
// GetX
// RiverPod
  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose");
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Column(
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavouriteModules()),
                  );
                },
                child: Text(count.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    )),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.pushNamed('/dialogScreen');
                },
                child: Text("Navigate"))
          ],
        )),
      ),
    );
  }
}


//1. initState
//2. didChangeDependencies
//3. build