import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_generator/utils/Widgets.dart';
import 'package:invoice_generator/utils/formfiled.dart';
import 'package:invoice_generator/view/screen/pdfscreen.dart';

import '../../utils/variables.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

GlobalKey<FormState> productValidation = GlobalKey<FormState>();

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: (!isAdded)
          ? AppBar(
              toolbarHeight: 80,
              title: Text("Invoice Maker",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              actions: [
                GestureDetector(
                  onTap: () async {
                    if (Products.length != 0) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PdfScreen(),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.orangeAccent,
                        content: Text("Atleast 1 product Required"),
                        duration: Duration(seconds: 2),
                        margin: EdgeInsets.all(40),
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: pdfButton(),
                )
              ],
            )
          : AppBar(
              toolbarHeight: 80,
              title: Text("Add Product",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
            ),
      body: (!isAdded)
          ? Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ...List.generate(
                          Products.length,
                          (index) => Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 100,
                                padding: EdgeInsets.only(
                                    left: 15, bottom: 10, right: 10, top: 10),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    // border: Border.all(color: Colors.grey),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          offset: Offset(0, 5),
                                          blurRadius: 10)
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            Products[index]['productName'].text,
                                            style: GoogleFonts.lato(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)),
                                        Row(
                                          children: [
                                            Text(
                                                Products[index]['productPrice']
                                                    .text,
                                                style: GoogleFonts.lato(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                                "x${Products[index]['productQuantity'].text}",
                                                style: GoogleFonts.lato(
                                                    color: Colors.grey,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              count = index;
                                              isAdded = true;
                                            });
                                          },
                                          child: editButton(),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Products.removeAt(index);
                                              count = Products.length - 1;
                                            });
                                          },
                                          child: deleteButton(),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            )
          : Form(
              key: productValidation,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product Name",
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      child: input(
                          Products[count]['productName'], TextInputType.text),
                    ),
                    Text("Product Price",
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      child: input(Products[count]['productPrice'],
                          TextInputType.number),
                    ),
                    Text("Product Quantity",
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      child: input(Products[count]['productQuantity'],
                          TextInputType.number),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            setState(() {
                              if (Products[count]['productName'].text == "" ||
                                  Products[count]['productPrice'].text == "" ||
                                  Products[count]['productQuantity'].text ==
                                      "") {
                                Products.removeAt(count);
                              }

                              isAdded = false;
                            });
                          },
                          child: cancelButton(),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            setState(() {
                              if (productValidation.currentState!.validate()) {
                                isAdded = false;
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 130,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: Offset(0, 9),
                                      blurRadius: 10)
                                ]),
                            child: Text("Save",
                                style: GoogleFonts.lato(
                                    color: Colors.white, fontSize: 18)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
      floatingActionButton: (!isAdded)
          ? CupertinoButton(
              child: Container(
                height: 50,
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                alignment: Alignment.center,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0, 9),
                          blurRadius: 10)
                    ]),
                child: Text("Add",
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 18)),
              ),
              onPressed: () {
                setState(() {
                  TextEditingController pName = TextEditingController();
                  TextEditingController pPrice = TextEditingController();
                  TextEditingController pQuantity = TextEditingController();
                  Map temp = {
                    'productName': pName,
                    'productPrice': pPrice,
                    'productQuantity': pQuantity,
                  };
                  Products.add(temp);

                  count = Products.length - 1;
                  isAdded = true;
                });
              },
            )
          : null,
    );
  }
}
