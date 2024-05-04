import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductItem extends StatefulWidget {
  ProductItem(this.prodId, this.title, {Key? key}) : super(key: key);

  final String prodId, title;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late Color bgColor;

  @override
  void initState() {
    super.initState();
    List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
    bgColor = colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context, listen: false);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: bgColor,
      ),
      title: Text("${widget.title}"),
      trailing: IconButton(
        onPressed: () => products.deleteProduct(widget.prodId),
        icon: Icon(
          Icons.delete,
          color: bgColor,
        ),
      ),
    );
  }
}
