import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ConnectivityService extends GetxService {
  final RxBool isConnected = true.obs;

  Future<ConnectivityService> init() async {
    Connectivity().onConnectivityChanged.listen((status) {
      isConnected.value = status != ConnectivityResult.none;
      if (!isConnected.value) {
        Get.snackbar(
          'No Internet',
          'Please check your connection.',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(12),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    });

    // Initial connectivity check
    var result = await Connectivity().checkConnectivity();
    isConnected.value = result != ConnectivityResult.none;

    return this;
  }
}
