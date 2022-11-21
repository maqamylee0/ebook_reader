import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wtm_ebook/reader.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(allowedExtensions: ["pdf"],
          type: FileType.custom);

      if (result != null) {
        File file = File(result.files.first.path!);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ReaderPage(doc: file)),
        );      } else {
        // User canceled the picker
      //user cancelled the selection process
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
      content: Text("File Selection Cancelled"),
      )
      );
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.upload_file),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
