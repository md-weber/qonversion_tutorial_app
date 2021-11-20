import 'package:qonversion_flutter/qonversion_flutter.dart';

class QonversionService {
  late final Future<void> init;

  QonversionService() {
    this.init = initializeQonversion();
  }

  Future<void> initializeQonversion() async {
    // TODO: use the Qonversion SDK to launch the project with your project key
    // TODO: Activate the debug mode to make purchases in testing environment
    throw UnimplementedError();
  }

  Future<QOffering?> getMainOffering() async {
    await init;
    // TODO: Get the main offerings from qonversion
    // TODO: Do not forget to try catch the errors
    throw UnimplementedError();
  }

  Future<QProduct> getProductById(String productId) async {
    await init;
    // TODO: Get the main offerings
    // TODO: Find the first product that contains the productId
    // TODO: If the product is null throw an Error
    // TODO: return the product
    throw UnimplementedError();
  }

  Future<void> purchaseProduct(QProduct product) async {
    await init;
    // TODO: Use Qonversion to purchase the product
    // TODO: Do not forget to Try Catch
    throw UnimplementedError();
  }

  Future<List<QProduct>> getPurchasedProducts() async {
    await init;
    // TODO: Check for the purchased products via the permissions
    // TODO: Ask for the product via getProductById;
    // TODO: Return the products
    throw UnimplementedError();
  }

  Future<List<QProduct>> getProducts() async {
    await init;
    // TODO: ask for the main offering
    // TODO: return all products on the offering.
    throw UnimplementedError();
  }
}
