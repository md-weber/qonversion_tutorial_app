import 'package:flutter/material.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:qonversion_tutorial_app/bloc/qonversion_service.dart';

class HomePage extends StatelessWidget {
  final QonversionService _service = QonversionService();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Explained - Products")),
      body: FutureBuilder<List<QProduct>>(
        future: _service.getProducts(),
        builder: (context, snapshot) {
          List<QProduct>? products;

          if (snapshot.hasData) {
            products = snapshot.data;
            if (products == null) return Text("No products where found");
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                QProduct product = products![index];
                print(product.toJson());
                return Card(
                  child: Text(product.storeTitle ?? "No Store Title"),
                );
              },
              itemCount: products.length,
            );
          }

          // TODO: Bau ne liste ;
          if (snapshot.hasError)
            return Text("Something went wrong, please try again later");
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
