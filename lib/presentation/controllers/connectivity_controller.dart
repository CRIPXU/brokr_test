import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ConnectivityController extends GetxController {
  final connectivityStream = StreamController<ConnectivityResult>();


  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityStream.add(result);
    });
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}