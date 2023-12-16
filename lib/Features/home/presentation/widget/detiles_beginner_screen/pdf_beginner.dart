import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/core/unit/styles.dart';
import 'package:flutter/material.dart';

class PdfBeginner extends StatefulWidget {
  const PdfBeginner({Key? key}) : super(key: key);

  @override
  State<PdfBeginner> createState() => _PdfBeginnerState();
}

class _PdfBeginnerState extends State<PdfBeginner> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String,dynamic>> list = [];

  Future<String> upLoadPdf(String fileName, File file) async{
   final ref =  FirebaseStorage.instance.ref('pdf/$fileName.pdf');

   final uploadTask = ref.putFile(file);

   await uploadTask.whenComplete(() {});

   final urlLink = await ref.getDownloadURL();

   return urlLink;
  }




  @override
  void initState() {
    // getPdf();
    initPdf();
    super.initState();
  }

  PDFDocument? pdfDocument;
  initPdf() async {
    pdfDocument = await PDFDocument.fromURL('https://firebasestorage.googleapis.com/v0/b/newflutter-6a968.appspot.com/o/pdf%2FMohamed_Ebrahim_Resume.pdf?alt=media&token=95c9d6b9-6649-4ced-98c0-1cade53a5aa6');
  setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(title: const Text('Pdf',style: Styles.textStyle16,),),
      body: pdfDocument != null ? PDFViewer(
        document: pdfDocument!,
      ) : Center(child: CircularProgressIndicator()),
    );
  }
}
