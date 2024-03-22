import 'package:flutter/cupertino.dart';

bool isAdded = false;
int count = 0;

TextEditingController txtProduct = TextEditingController();
TextEditingController txtPrice = TextEditingController();
TextEditingController txtQuantity = TextEditingController();

List Products = [];

String total() {
  dynamic sum = 0;
  for (int i = 0; i < Products.length; i++) {
    sum += Products[i]['productPrice'].text;
  }
  return sum.toString();
}
