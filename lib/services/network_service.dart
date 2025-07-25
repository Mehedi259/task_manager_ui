import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  final RxBool hasConnection = true.obs;

  Future<NetworkService> init() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      hasConnection.value = result != ConnectivityResult.none;
    } as void Function(List<ConnectivityResult> event)?);

    // Initial check
    final result = await Connectivity().checkConnectivity();
    hasConnection.value = result != ConnectivityResult.none;

    return this;
  }
}
