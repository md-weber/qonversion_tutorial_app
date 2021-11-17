import 'package:qonversion_flutter/qonversion_flutter.dart';

class QonversionService {
  Future<void> initializeQonversion() async {
    await Qonversion.launch('fVz6Vy7hRcoei0QihTkwGMx1PZ6c-qBB',
        isObserveMode: false);
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
    } catch (e) {
      print(e);
    }
  }
}
