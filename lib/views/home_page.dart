import 'package:flutter/material.dart';
import 'package:qonversion_tutorial_app/bloc/qonversion_service.dart';
import 'package:qonversion_tutorial_app/views/home/product_list.dart';
import 'package:qonversion_tutorial_app/views/home/purchased_products.dart';

class HomePage extends StatelessWidget {
  final QonversionService _service = QonversionService();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Qonversion Store")),
      body: Column(children: [
        Expanded(
          flex: 3,
          child: ProductList(service: _service),
        ),
        SizedBox(height: 8),
        Expanded(
          flex: 2,
          child: PurchasedProducts(service: _service),
        ),
      ]),
    );
  }
}
