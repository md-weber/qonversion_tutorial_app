import 'package:flutter/material.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:qonversion_tutorial_app/bloc/qonversion_service.dart';
import 'package:qonversion_tutorial_app/views/home/product_list.dart';

class HomePage extends StatelessWidget {
  final QonversionService _service = QonversionService();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Explained - Products")),
      body: Column(children: [
        Expanded(
          flex: 3,
          child: ProductList(service: _service),
        ),
        SizedBox(height: 8),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text("Bought Products"),
              Expanded(
                  child: FutureBuilder<List<QProduct>>(
                future: _service.getProductsWithPermission(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text(snapshot.error.toString());
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data
                                ?.elementAt(index)
                                .skProduct
                                ?.localizedTitle ??
                            ""),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      itemCount: snapshot.data?.length,
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ))
            ],
          ),
        ),
      ]),
    );
  }
}
