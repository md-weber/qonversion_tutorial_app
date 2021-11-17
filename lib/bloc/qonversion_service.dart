import 'package:qonversion_flutter/qonversion_flutter.dart';

import '../keys.dart';

class QonversionService {
  final _debugMode = true;

  Future<void> initializeQonversion() async {
    await Qonversion.launch(qonversion_project_key, isObserveMode: false);

    if (_debugMode) Qonversion.setDebugMode();
  }

  Future<QOffering?> getMainOffering() async {
    try {
      QOfferings offerings = await Qonversion.offerings();
      QOffering? offering = offerings.main;
      return offering;
    } catch (e) {
      print("[QonversionService] Unexpected error $e");
    }
  }

  Future<List<QProduct>> getProducts() async {
    await initializeQonversion();
    final QOffering? offering = await getMainOffering();
    if (offering == null) {
      throw Error();
    }

    return offering.products;
  }

  Future<void> purchaseProduct(QProduct product) async {
    await initializeQonversion();
    try {
      await Qonversion.purchaseProduct(product);
      print("Successful purchased a product");
    } catch (e) {
      print(e);
    }
  }
}
