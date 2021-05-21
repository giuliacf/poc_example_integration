import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/products/screens/product_form.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends ModularState<ProductsPage, ProductsStore> {
  _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar produto'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: ProductForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de produtos'),
      ),
      body: Observer(
        builder: (context) {
          return Container(child: Text('Aqui fica a lista'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Adicionar produto',
        onPressed: () {
          if (screenWidth > 700) {
            _showDialog();
          } else {
            Modular.to.navigate('/adicionar-produto');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
