import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  bool isShowingDialog = false;

  @override
  void onInit() async {
    super.onInit();
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      isShowingDialog = true;
      showDialog();
    }

    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        isShowingDialog = true;
        showDialog();
      } else {
        if (isShowingDialog) {
          BotToast.cleanAll();
          isShowingDialog = false;
        }
      }
    });
  }

  void showDialog() {
    BotToast.showText(
        text: 'No internet connection', duration: const Duration(seconds: 100));
  }
}
