import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/variables.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as r;
import 'package:printing/printing.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => generatepdf(),
    );
  }
}

Future<Uint8List> generatepdf() async {
  final pdf = r.Document();
  var lato = await PdfGoogleFonts.latoBlack();

  pdf.addPage(r.Page(
    pageFormat: PdfPageFormat.a4,
    build: (context) => r.Column(children: [
      r.Row(mainAxisAlignment: r.MainAxisAlignment.center, children: [
        r.Text("Ultimate Supermarket ",
            style: r.TextStyle(font: lato, fontSize: 30))
      ]),
      r.SizedBox(height: 25),
      r.Row(mainAxisAlignment: r.MainAxisAlignment.center, children: [
        r.Text("Invoice", style: r.TextStyle(font: lato, fontSize: 25))
      ]),
      r.SizedBox(height: 25),
      r.Row(mainAxisAlignment: r.MainAxisAlignment.center, children: [
        r.Text("167 ,near super complex, san francisco , united states america",
            style: r.TextStyle(font: lato, fontSize: 18))
      ]),
      r.SizedBox(height: 25),
      r.Table(border: r.TableBorder.all(width: 2), children: [
        r.TableRow(children: [
          r.Text("Sr.",
              textAlign: r.TextAlign.center,
              style: r.TextStyle(font: lato, fontSize: 15)),
          r.Text("Product Name",
              textAlign: r.TextAlign.center,
              style: r.TextStyle(font: lato, fontSize: 15)),
          r.Text("Price",
              textAlign: r.TextAlign.center,
              style: r.TextStyle(font: lato, fontSize: 15)),
          r.Text("Quantity",
              textAlign: r.TextAlign.center,
              style: r.TextStyle(font: lato, fontSize: 15)),
        ]),
        ...List.generate(
          Products.length,
          (index) => r.TableRow(children: [
            r.Text("${index + 1}",
                textAlign: r.TextAlign.center,
                style: r.TextStyle(font: lato, fontSize: 15)),
            r.Text(Products[index]['productName'].text,
                textAlign: r.TextAlign.center,
                style: r.TextStyle(font: lato, fontSize: 15)),
            r.Text(Products[index]['productPrice'].text,
                textAlign: r.TextAlign.center,
                style: r.TextStyle(font: lato, fontSize: 15)),
            r.Text(Products[index]['productQuantity'].text,
                textAlign: r.TextAlign.center,
                style: r.TextStyle(font: lato, fontSize: 15)),
          ]),
        ),
        r.TableRow(children: [
          r.Text("${total()}",
              textAlign: r.TextAlign.center,
              style: r.TextStyle(font: lato, fontSize: 15)),
        ]),
      ])
    ]),
  ));
  return await pdf.save();
}
