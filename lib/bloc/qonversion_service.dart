import 'package:qonversion_flutter/qonversion_flutter.dart';

import '../secret.dart';

class QonversionService {
  Future<void> initializeQonversion() async {
    await Qonversion.launch('$qonversion_project_id', isObserveMode: false);
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
}
