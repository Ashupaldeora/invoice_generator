import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container deleteButton() {
  return Container(
    height: 35,
    width: 70,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.red.withOpacity(0.1)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.delete,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text("Delete",
            style: GoogleFonts.lato(
                color: Colors.red, fontSize: 10, fontWeight: FontWeight.w500)),
      ],
    ),
  );
}

Container editButton() {
  return Container(
    height: 35,
    width: 70,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.yellow.withOpacity(0.1)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.edit,
          size: 15,
          color: Colors.orangeAccent,
        ),
        SizedBox(
          width: 5,
        ),
        Text("Edit",
            style: GoogleFonts.lato(
                color: Colors.orangeAccent,
                fontSize: 10,
                fontWeight: FontWeight.w500)),
      ],
    ),
  );
}

Container cancelButton() {
  return Container(
    height: 50,
    width: 130,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(50)),
    child: Text("Cancel",
        style: GoogleFonts.lato(color: Colors.white, fontSize: 18)),
  );
}

Container pdfButton() {
  return Container(
    margin: EdgeInsets.only(right: 10),
    height: 35,
    width: 120,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.orangeAccent,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Text(
      "Generate Pdf",
      style: GoogleFonts.lato(color: Colors.white, fontSize: 13),
    ),
  );
}
