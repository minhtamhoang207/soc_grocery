import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/data/models/response/product_response.dart';
import 'package:soc_grocery/domain/usecases/product/get_product_usecase.dart';

class ShopController extends GetxController {

  final GetProductUseCase _getProductUseCase;
  ShopController(this._getProductUseCase);

  final List<String> imgList = [
    'https://static.vecteezy.com/system/resources/previews/001/229/304/original/box-of-groceries-on-yellow-background-free-photo.jpg',
    'https://c8.alamy.com/comp/H1T1N0/grocery-shopping-banner-with-consumer-holding-a-bag-filled-with-vegetables-H1T1N0.jpg',
    'https://i.ytimg.com/vi/_m62Jx049VI/maxresdefault.jpg'
  ];

  Rx<List<ProductResponse>> listProduct = Rx([]);
  Rx<String> currentPosition = Rx('.........');

  Future<String> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final coordinates = Coordinates(position.latitude, position.longitude);
    final addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    final first = addresses.first;
    return "${first.addressLine}";
  }

  @override
  void onInit() async {
    listProduct.value = await _getProductUseCase.execute('');
    currentPosition.value = await _determinePosition();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
