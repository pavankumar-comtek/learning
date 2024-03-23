import 'dart:async';

class CounterStream {
  //Stream Controller is used to access the data flowing in the stream.
  final StreamController<int> streamController = StreamController<int>();

  int count = 0;
  //Stream Sink means the input of data to stream
  void addNumberToSink(int number) {
    count = count + number;
    streamController.sink.add(count);
  }

  void close() {
    streamController.close();
  }
}
