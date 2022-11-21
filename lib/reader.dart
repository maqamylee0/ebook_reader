import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class ReaderPage extends StatefulWidget {
  const ReaderPage({Key? key , required this.doc}) : super(key: key);

  final File doc;
  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PdfView(
            controller: PdfController(
              document: PdfDocument.openFile(widget.doc.path),
            )
        )
    );
  }
}