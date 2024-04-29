import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:learning/controllers/base_controller.dart';
import 'package:learning/models/volume_response.dart';

class ExampleController extends BaseController {
  // int then RxInt
  //double then RxDouble
  //String then RxString
  //List then RxList
  RxList<int> list = <int>[].obs;
  RxMap<String, dynamic> map = <String, dynamic>{}.obs;
  RxList<VolumeResponse> volumeList = <VolumeResponse>[].obs;

  RxInt count = 0.obs;
  increment() => count.value++;

  
}
