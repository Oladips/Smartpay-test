// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxController {
  int connectionType = 0;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  bool hasCOnnection = false;

  @override
  void onInit() {
    super.onInit();
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateStatus);
  }

  Future<void> getConnectionType() async {
    // ignore: prefer_typing_uninitialized_variables
    var connectivityResult;
    try {
      connectivityResult = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log(e.toString());
    }
    return _updateStatus(connectivityResult);
  }

  _updateStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = 1;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType = 2;
        update();
        break;
      case ConnectivityResult.none:
        connectionType = 0;
        update();
        break;
      default:
    }
  }

  @override
  void onClose() {
    super.onClose();
    _streamSubscription.cancel();
  }
}
