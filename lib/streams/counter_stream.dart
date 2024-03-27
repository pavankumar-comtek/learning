import 'dart:async';

///There are two type of Stream in Dart
///1. Single Subscription Stream
///2. Broadcast Stream

///Single Subscription Stream is used when we want to listen the stream only once.
///By default every stream is Single Subscription Stream.
///Broadcast Stream is used when we want to listen the stream multiple times.
///To create a Broadcast Stream we need to use StreamController.broadcast() constructor.

///Listener is a class which listens to the stream.

///StreamTransformer is used to transform the data of the stream.
class CounterStream {
  //Stream Controller is used to access the data flowing in the stream.
  final StreamController<int> streamController =
      StreamController<int>.broadcast();

  //Broadcast Stream
  //final StreamController<int> broadCaststreamController = StreamController<int>.broadcast();

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
